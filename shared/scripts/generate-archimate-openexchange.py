#!/usr/bin/env python3

import argparse
from pathlib import Path
import xml.etree.ElementTree as ET
from typing import Optional, Dict, List, Tuple

try:
    import yaml
except ImportError:
    raise SystemExit("Chybí PyYAML. Nainstaluj: pip install pyyaml")


NS = "http://www.opengroup.org/xsd/archimate/3.0/"
XSI_NS = "http://www.w3.org/2001/XMLSchema-instance"

ET.register_namespace("", NS)
ET.register_namespace("xsi", XSI_NS)


TYPE_MAP = {
    "stakeholder": "Stakeholder",
    "driver": "Driver",
    "assessment": "Assessment",
    "goal": "Goal",
    "requirement": "Requirement",
    "constraint": "Constraint",
    "principle": "Principle",
    "business-service": "BusinessService",
    "business-process": "BusinessProcess",
    "business-object": "BusinessObject",
    "business-actor": "BusinessActor",
    "contract": "Contract",
    "application-component": "ApplicationComponent",
    "application-service": "ApplicationService",
    "data-object": "DataObject",
    "node": "Node",
    "device": "Device",
    "system-software": "SystemSoftware",
    "communication-network": "CommunicationNetwork",
    "facility": "Facility",
    "technology-service": "TechnologyService",
    "project": "WorkPackage",
    "work-package": "WorkPackage",
    "deliverable": "Deliverable",
    "plateau": "Plateau",
    "gap": "Gap",
    "grouping": "Grouping",
}

REL_MAP = {
    "access": "Access",
    "aggregation": "Aggregation",
    "assignment": "Assignment",
    "association": "Association",
    "composition": "Composition",
    "flow": "Flow",
    "influence": "Influence",
    "realization": "Realization",
    "serving": "Serving",
    "triggering": "Triggering",
}


def q(tag: str) -> str:
    return f"{{{NS}}}{tag}"


def load_yaml(path: Path) -> Dict:
    if not path.exists():
        raise FileNotFoundError(f"Soubor neexistuje: {path}")
    with path.open("r", encoding="utf-8") as f:
        return yaml.safe_load(f) or {}


def add_name(parent: ET.Element, text: str) -> None:
    name = ET.SubElement(parent, q("name"), {"xml:lang": "en"})
    name.text = text


def add_label(parent: ET.Element, text: str) -> None:
    label = ET.SubElement(parent, q("label"), {"xml:lang": "en"})
    label.text = text


def add_documentation(parent: ET.Element, text: Optional[str]) -> None:
    if not text:
        return
    doc = ET.SubElement(parent, q("documentation"), {"xml:lang": "en"})
    doc.text = text


def stable_xml_id(prefix: str, raw_id: str) -> str:
    safe = (
        raw_id.replace("_", "-")
        .replace(" ", "-")
        .replace("/", "-")
        .replace("~", "home")
    )
    return f"{prefix}-{safe}"


def create_model(project_id: str, model_name: str) -> ET.Element:
    model = ET.Element(
        q("model"),
        {
            "identifier": f"id-{project_id}-model",
        },
    )
    add_name(model, model_name)
    return model


def add_elements(model: ET.Element, elements_data: List[Dict]) -> Dict[str, str]:
    elements_el = ET.SubElement(model, q("elements"))
    id_map: Dict[str, str] = {}

    for item in elements_data:
        source_id = item["id"]
        archi_type = TYPE_MAP.get(item["type"])

        if not archi_type:
            raise ValueError(f"Neznámý element type: {item['type']} u {source_id}")

        xml_id = stable_xml_id("id", source_id)
        id_map[source_id] = xml_id

        element = ET.SubElement(
            elements_el,
            q("element"),
            {
                "identifier": xml_id,
                f"{{{XSI_NS}}}type": archi_type,
            },
        )

        add_name(element, item.get("name", source_id))
        add_documentation(element, item.get("description"))

    return id_map


def add_relationships(
    model: ET.Element,
    relationships_data: List[Dict],
    element_id_map: Dict[str, str],
) -> Dict[str, str]:
    relationships_el = ET.SubElement(model, q("relationships"))
    rel_id_map: Dict[str, str] = {}

    for item in relationships_data:
        source = item["source"]
        target = item["target"]

        if source not in element_id_map:
            raise ValueError(
                f"Relationship {item['id']} odkazuje na neexistující source: {source}"
            )

        if target not in element_id_map:
            raise ValueError(
                f"Relationship {item['id']} odkazuje na neexistující target: {target}"
            )

        rel_type = REL_MAP.get(item["type"])
        if not rel_type:
            raise ValueError(
                f"Neznámý relationship type: {item['type']} u {item['id']}"
            )

        xml_id = stable_xml_id("rel", item["id"])
        rel_id_map[item["id"]] = xml_id

        relationship = ET.SubElement(
            relationships_el,
            q("relationship"),
            {
                "identifier": xml_id,
                f"{{{XSI_NS}}}type": rel_type,
                "source": element_id_map[source],
                "target": element_id_map[target],
            },
        )

        add_name(relationship, item.get("name", item["id"]))
        add_documentation(relationship, item.get("description"))

    return rel_id_map


def simple_layout(elements: List[str]) -> Dict[str, Tuple[int, int]]:
    positions: Dict[str, Tuple[int, int]] = {}
    x = 100
    y = 100
    step_y = 150

    for idx, element_id in enumerate(elements):
        positions[element_id] = (x, y + idx * step_y)

    return positions


def add_organizations(
    model: ET.Element,
    elements_data: List[Dict],
    relationships_data: List[Dict],
    views_data: List[Dict],
    element_id_map: Dict[str, str],
    rel_id_map: Dict[str, str],
) -> None:
    organizations = ET.SubElement(model, q("organizations"))

    elements_folder = ET.SubElement(
        organizations,
        q("item"),
        {"identifier": "id-elements-folder"},
    )
    add_label(elements_folder, "Elements")

    by_layer: Dict[str, List[Dict]] = {}
    for item in elements_data:
        by_layer.setdefault(item.get("layer", "other"), []).append(item)

    for layer, layer_elements in sorted(by_layer.items()):
        folder = ET.SubElement(
            elements_folder,
            q("item"),
            {"identifier": f"id-folder-{layer}"},
        )
        add_label(folder, layer)

        for item in layer_elements:
            ET.SubElement(
                folder,
                q("item"),
                {"identifierRef": element_id_map[item["id"]]},
            )

    relationships_folder = ET.SubElement(
        organizations,
        q("item"),
        {"identifier": "id-relationships-folder"},
    )
    add_label(relationships_folder, "Relationships")

    for item in relationships_data:
        if item["id"] in rel_id_map:
            ET.SubElement(
                relationships_folder,
                q("item"),
                {"identifierRef": rel_id_map[item["id"]]},
            )

    views_folder = ET.SubElement(
        organizations,
        q("item"),
        {"identifier": "id-views-folder"},
    )
    add_label(views_folder, "Views")

    for view in views_data:
        ET.SubElement(
            views_folder,
            q("item"),
            {"identifierRef": stable_xml_id("view", view["id"])},
        )


def add_views(
    model: ET.Element,
    views_data: List[Dict],
    relationships_data: List[Dict],
    element_id_map: Dict[str, str],
    rel_id_map: Dict[str, str],
) -> None:
    relationship_lookup = {item["id"]: item for item in relationships_data}

    views_el = ET.SubElement(model, q("views"))
    diagrams_el = ET.SubElement(views_el, q("diagrams"))

    for view in views_data:
        view_id = stable_xml_id("view", view["id"])

        diagram = ET.SubElement(
            diagrams_el,
            q("view"),
            {
                "identifier": view_id,
                f"{{{XSI_NS}}}type": "Diagram",
            },
        )

        add_name(diagram, view.get("name", view["id"]))
        add_documentation(diagram, view.get("description"))

        elements = view.get("elements", [])
        relationships = view.get("relationships", [])

        positions = simple_layout(elements)
        node_id_map: Dict[str, str] = {}

        for element_id in elements:
            if element_id not in element_id_map:
                continue

            x, y = positions[element_id]
            node_xml_id = f"node-{view['id']}-{element_id}"
            node_id_map[element_id] = node_xml_id

            ET.SubElement(
                diagram,
                q("node"),
                {
                    "identifier": node_xml_id,
                    f"{{{XSI_NS}}}type": "Element",
                    "elementRef": element_id_map[element_id],
                    "x": str(x),
                    "y": str(y),
                    "w": "220",
                    "h": "90",
                },
            )

        for rel_id in relationships:
            if rel_id not in rel_id_map:
                continue

            rel = relationship_lookup.get(rel_id)
            if not rel:
                continue

            source_element = rel["source"]
            target_element = rel["target"]

            if source_element not in node_id_map or target_element not in node_id_map:
                continue

            ET.SubElement(
                diagram,
                q("connection"),
                {
                    "identifier": f"conn-{view['id']}-{rel_id}",
                    f"{{{XSI_NS}}}type": "Relationship",
                    "relationshipRef": rel_id_map[rel_id],
                    "source": node_id_map[source_element],
                    "target": node_id_map[target_element],
                },
            )


def indent_xml(elem: ET.Element, level: int = 0) -> None:
    i = "\n" + level * "  "

    if len(elem):
        if not elem.text or not elem.text.strip():
            elem.text = i + "  "

        for child in elem:
            indent_xml(child, level + 1)

        if not child.tail or not child.tail.strip():
            child.tail = i

    if level and (not elem.tail or not elem.tail.strip()):
        elem.tail = i


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Generate ArchiMate Open Exchange XML from SpecSystem YAML model files."
    )

    parser.add_argument("project_id", help="Project ID, e.g. spec-system")
    parser.add_argument("--model-name", default=None, help="Model name")

    args = parser.parse_args()

    root = Path.home() / "SpecSystem"
    project_dir = root / "shared/models/archimate/projects" / args.project_id

    elements_yaml = project_dir / "elements.yaml"
    relationships_yaml = project_dir / "relationships.yaml"
    views_yaml = project_dir / "views.yaml"

    output_dir = project_dir / "generated"
    output_dir.mkdir(parents=True, exist_ok=True)

    output_xml = output_dir / "open-exchange.xml"

    elements_data = load_yaml(elements_yaml).get("elements", [])
    relationships_data = load_yaml(relationships_yaml).get("relationships", [])
    views_data = load_yaml(views_yaml).get("views", [])

    model_name = args.model_name or f"{args.project_id} ArchiMate Model"

    model = create_model(args.project_id, model_name)

    element_id_map = add_elements(model, elements_data)
    rel_id_map = add_relationships(model, relationships_data, element_id_map)

    add_organizations(
        model,
        elements_data,
        relationships_data,
        views_data,
        element_id_map,
        rel_id_map,
    )

    add_views(
        model,
        views_data,
        relationships_data,
        element_id_map,
        rel_id_map,
    )

    indent_xml(model)

    tree = ET.ElementTree(model)
    tree.write(output_xml, encoding="utf-8", xml_declaration=True)

    print("Open Exchange XML generated:")
    print(f"  {output_xml}")


if __name__ == "__main__":
    main()
