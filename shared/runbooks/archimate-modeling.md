# ArchiMate Modeling

## Účel

Tento runbook popisuje práci s ArchiMate modely v rámci SpecSystem.

ArchiMate model slouží jako:
- formální projekce specifikace,
- architektonický graf systému,
- validovatelný model vztahů,
- zdroj views a exportů.

---

# Umístění modelů

## Globální modely

```text
shared/models/archimate/global/
```

## Projektové modely

```text
shared/models/archimate/projects/<project-id>/
```

---

# Principy modelování

- model není kanonická pravda,
- SPEC je source of truth,
- model je formální projekce SPEC,
- model musí být validovatelný,
- model nesmí obsahovat nezdokumentované entity,
- změny modelu musí být traceable ke SPEC.

---

# Vazba na SPEC

```text
SPEC
    ↓
ArchiMate model
    ↓
Views / exports / dokumentace
```

---

# Doporučený workflow

## 1. Definovat SPEC

Nejdříve:
- architecture.md
- components.yaml
- decisions.md

---

## 2. Modelovat ArchiMate

Vytvořit:
- elements
- relationships
- views

---

## 3. Validovat model

Kontrolovat:
- konzistenci,
- orphan entities,
- vazby,
- naming,
- duplicity.

---

## 4. Export

Generovat:
- Open Exchange XML,
- views,
- dokumentaci.

---

# Struktura projektového modelu

```text
shared/models/archimate/projects/<project-id>/
├── elements.yaml
├── relationships.yaml
├── views.yaml
├── graph.json
├── open-exchange.xml
└── validation-report.md
```

---

# Typy artefaktů

## elements.yaml

Definice:
- aplikací,
- business objektů,
- komponent,
- technologií,
- služeb.

---

## relationships.yaml

Definice vztahů:
- serving,
- flow,
- assignment,
- realization,
- access,
- composition,
- aggregation.

---

## views.yaml

Definice:
- diagram views,
- viewpoints,
- render konfigurace.

---

## graph.json

Interní grafová reprezentace modelu.

Použití:
- validace,
- traversal,
- graph queries,
- RAG enrichment.

---

## open-exchange.xml

Standardní ArchiMate Open Exchange export.

Použití:
- import/export,
- interoperabilita nástrojů.

---

# Naming conventions

## IDs

Používat:
- stabilní IDs,
- lowercase,
- kebab-case.

Příklad:

```text
customer-api
identity-service
document-storage
```

---

## View names

Používat:

```text
<context>-view
```

Příklad:

```text
application-cooperation-view
technology-landscape-view
integration-view
```

---

# Validace

Kontrolovat:

- orphan elements,
- duplicate IDs,
- broken relationships,
- invalid references,
- cyclic dependency problémy,
- nesoulad se SPEC.

---

# Synchronizace se SPEC

Model:
- nesmí divergovat od SPEC,
- musí být auditovatelný,
- musí být regenerovatelný.

---

# LLM omezení

LLM může:
- navrhovat model,
- generovat relationships,
- generovat views,
- pomáhat s validací.

LLM nesmí:
- autonomně měnit model,
- vytvářet neexistující entity,
- přepisovat validovaný model bez potvrzení.

---

# Budoucí rozšíření

Plánované:

- automatická SPEC → ArchiMate projekce
- reverse validation
- graph traversal
- semantic impact analysis
- model diffing
- automated views generation
- Open Exchange synchronization

---

# Troubleshooting

## Nevalidní relationship

Zkontrolovat:
- source ID,
- target ID,
- typ relationship.

---

## Duplicate IDs

Každý element musí mít unikátní ID.

---

## Invalid Open Exchange XML

Validovat:
- schema,
- namespaces,
- references,
- relationship endpoints.
