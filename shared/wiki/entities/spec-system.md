## Entity-Oriented Wiki Page

### Source Evidence Repository

- **Entity Type**: Repository
- **Purpose**: To store raw source documents and their metadata, facilitating reproducible extraction of information for further processing.
- **Responsibilities**:
  - Uchování zdrojových dokumentů v nezpracované podobě.
  - Pořizování a udržování metadat (provozní informace jako zdroj, verze, hash).
  - Preprocessing of text and chunking for consistent extraction.
- **Relationships**:
  - Interacts with SpecSystem to provide raw data for documentation generation.
  - Used by LLM Agent for information extraction and synthesis.
- **Dependencies**: None specific; interacts broadly across the system's information flow.
- **Constraints**:
  - Raw data storage must ensure integrity and accessibility.
- **Traceability**: Referenced in project documentation and linked to SpecSystem artifacts.
- **Related Concepts**: Repository, Document Management
- **Related Decisions**: Artifact preservation and preprocessing for consistency.

### Obsidian / LLM Wiki

- **Entity Type**: Application
- **Purpose**: To serve as a knowledge base system by managing entities like applications, processes, data, and technologies through linking concepts.
- **Responsibilities**:
  - Documenting and organizing project-related entities.
  - Providing syntesis of documents for better comprehension.
  - Maintaining a semantic graph via links between related items.
- **Relationships**:
  - Relies on SpecSystem to maintain accurate and up-to-date information across projects.
  - Provides the foundation for knowledge management within Obsidian and LLM integration.
- **Dependencies**: Directly dependent on SpecSystem for data accuracy and consistency.
- **Constraints**:
  - Must adhere to semantic structure guidelines for effective knowledge representation.
- **Traceability**: Linked back to project-specific repositories and SpecSystem artifacts.
- **Related Concepts**: Semantic Web, Knowledge Management
- **Related Decisions**: Semantic linking rules, document synthesis processes.

### SpecSystem

- **Entity Type**: System
- **Purpose**: To serve as the canonical specification system for a project, ensuring consistency in documentation and decision-making processes.
- **Responsibilities**:
  - Maintaining project specifications in YAML + Markdown format.
  - Managing version control with Git.
  - Recording architectural decisions (ADR).
  - Ensuring traceability from model to implementation.
- **Relationships**:
  - Integrates with Source Evidence Repository for raw data input.
  - Works closely with ArchiMate Model Repository for formal model representation.
  - Directly linked to LLM Agent for synthesis and suggestion of changes in specifications and models.
- **Dependencies**: Requires proper version control mechanisms (Git) for effective maintenance.
- **Constraints**:
  - Specifications must be human-readable as well as machine-interpretable.
  - Documentation generation from artifacts should yield coherent documents.
- **Traceability**: Linked to project repositories, ArchiMate model, and output documentation layers.
- **Related Concepts**: Specification Management, Version Control
- **Related Decisions**: Specification format standardization, traceability rules.

### ArchiMate Model Repository

- **Entity Type**: Repository
- **Purpose**: To manage architectural models in a formal manner through elements, relationships, views, and validation mechanisms.
- **Responsibilities**:
  - Maintaining the integrity of architectural model elements.
  - Establishing and validating relationships between different model entities.
  - Providing import/export functionality for Open Exchange XML formats.
- **Relationships**:
  - Integrates with SpecSystem to ensure formal representation of project specifications.
  - Supports Document Generation layer by providing validated models for output generation.
- **Dependencies**: Needs a standard validation framework for ArchiMate models.
- **Constraints**:
  - Must support cross-project views and consistent model validation.
- **Traceability**: Linked to project repositories, SpecSystem artifacts, and document outputs.
- **Related Concepts**: Model Management, Formal Representation
- **Related Decisions**: Validation rules, import/export formats.

### LLM Agent (Local)

- **Entity Type**: Service
- **Purpose**: To assist in information extraction from sources, propose changes to specifications and models based on synthesis and summary generation.
- **Responsibilities**:
  - Extracting and summarizing data from source repositories for knowledge management.
  - Synthesizing suggestions for changes in documentation or models to improve coherence and consistency.
  - Adheres strictly to the role of an assistant rather than authority.
- **Relationships**:
  - Interacts with Source Evidence Repository, SpecSystem, and ArchiMate Model Repository to provide support.
  - Supports Document Generation layer by suggesting necessary updates for better output generation.
- **Dependencies**: Requires access to comprehensive data sets from repositories and models.
- **Constraints**:
  - Must respect the deterministic nature of validation and export processes within the system.
- **Traceability**: Linked back to source documents, project specifications, and model representations.
- **Related Concepts**: Information Extraction, Synthesis
- **Related Decisions**: Role definition in documentation management.

### Document Generation Layer

- **Entity Type**: System Component
- **Purpose**: To generate coherent output documentation based on the formal models provided by ArchiMate Model Repository and data from SpecSystem.
- **Responsibilities**:
  - Generating output documents that align with project requirements and standards.
  - Ensuring deterministic outputs through validation processes established for the system.
- **Relationships**:
  - Dependent on the integrity of model representations from ArchiMate Model Repository.
  - Utilizes synthesized data and suggestions provided by LLM Agent to refine document generation.
- **Dependencies**: Requires proper integration with all previous layers (repositories, models) for effective operation.
- **Constraints**: Must maintain consistency in generated outputs aligned with project standards.
- **Traceability**: Linked back to project specifications and model representations used as inputs.
- **Related Concepts**: Output Generation, Deterministic Processes
- **Related Decisions**: Standardization of output formats, validation rules.