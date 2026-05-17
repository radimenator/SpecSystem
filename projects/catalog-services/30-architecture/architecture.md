# Architektura

## Účel architektury

Architektura systému je navržena jako vícevrstvý service composition model, který propojuje enterprise architekturu, katalog služeb, inventory technologických objektů, SLA model, costing model a zákaznické služby.

Základní tok:

    ArchiMate objekt
    → katalogový list
    → elementární služba
    → agregační služba
    → zákaznická služba
    → SLA / pricing / simulace

Cílem architektury je:

- standardizovat technologické stavební objekty,
- umožnit skládání agregačních služeb,
- automatizovat výpočet SLA,
- automatizovat pricing,
- zajistit auditovatelnost costing modelu,
- propojit enterprise architekturu s provozním modelem,
- připravit datový model pro budoucí provisioning a objednávkový portál.

Architektura je:

- inventory-driven,
- service-oriented,
- topology-aware,
- SLA-aware,
- pricing-aware,
- auditovatelná,
- verzovatelná.

---

# Architektonické vrstvy

## ES — Elementární služby

Elementární služby představují standardizované technologické stavební položky.

ES jsou:

- inventory-driven,
- technické,
- nákladově měřitelné,
- samostatně neprodávané jako business produkt,
- vstupem pro agregační služby.

Příklady:

- lokalita,
- rack,
- server,
- router,
- WAN linka,
- virtualizační node,
- Kubernetes node,
- F5 appliance,
- storage,
- monitoring profile,
- backup capability.

ES poskytuje:

- raw cost,
- technické capability,
- provozní atributy,
- omezení,
- dostupnostní vstupy.

ES sama o sobě nevytváří výsledné SLA zákaznické služby.

---

## AG — Agregační služby

Agregační služby skládají elementární služby do technické kompozice.

AG vrstva definuje:

- použité elementární služby,
- topology,
- dependency graph,
- redundancy groups,
- mandatory/optional prvky,
- availability profile,
- technical SLA model.

AG je technická kompoziční vrstva.

AG není primárně obchodně oceňovaný zákaznický produkt.

Příklady:

- UPAAS platforma,
- publikační platforma,
- virtualizační cluster,
- backup platform,
- application delivery platform,
- HA runtime prostředí.

UPAAS je v tomto modelu agregační služba, pokud reprezentuje technické prostředí složené z elementárních položek.

---

## CS — Zákaznické služby

Zákaznické služby představují business-facing nabídku nad agregačními službami.

CS vrstva přidává:

- business význam,
- business SLA,
- business overhead,
- volitelné business operace,
- zákaznický popis,
- finální cenu,
- governance,
- order-readiness.

Příklady:

- Publikovaná aplikace GOLD,
- VDI Workspace,
- DR Application,
- HA Hosting,
- Managed Application Runtime.

CS využívá jednu nebo více AG služeb.

CS nevytváří technickou dostupnost z ničeho; business SLA vychází z technického SLA / availability modelu AG vrstvy.

---

# Hlavní komponenty

## 1. Catalog Core / Metadata Service

Odpovědnost:

- společná metadata katalogových objektů,
- lifecycle,
- versioning,
- publikace,
- audit log,
- ownership,
- schvalování změn.

Tato komponenta je cross-layer capability pro ES, AG i CS.

---

## 2. Elementary Services Catalog

Odpovědnost:

- evidence elementárních služeb,
- evidence katalogových listů ES,
- operational profile,
- raw cost,
- technologické atributy,
- JSON import/export ES položek.

Obsahuje například:

- lokality,
- racky,
- servery,
- linky,
- routery,
- runtime platformy,
- technologické capability.

---

## 3. Aggregation Services Catalog

Odpovědnost:

- evidence agregačních služeb,
- skládání ES do AG,
- topology model,
- redundancy model,
- dependency graph,
- availability input model,
- JSON import/export AG položek.

AG katalog je klíčová kompoziční vrstva systému.

---

## 4. Customer Services Catalog

Odpovědnost:

- evidence zákaznických služeb,
- vazby CS → AG,
- business overhead,
- business options,
- zákaznický popis,
- JSON import/export CS položek.

CS katalog je business-facing vrstva.

---

## 5. SLA Engine

Odpovědnost:

- výpočet technické dostupnosti,
- výpočet SLA z AG topologie,
- vyhodnocení redundancy groups,
- simulace výpadků,
- výpočet dopadů změn topologie.

SLA vzniká primárně na AG vrstvě.

Vstupy:

- topology model,
- redundancy groups,
- locality distribution,
- HA model,
- mandatory/optional prvky,
- technické capability ES.

Výstupy:

- availability result,
- SLA profile evaluation,
- failure impact,
- explainability trace.

---

## 6. Pricing Engine

Odpovědnost:

- výpočet ceny zákaznických služeb,
- costing inheritance,
- topology multiplier,
- business overhead,
- volitelné business operace,
- pricing trace,
- simulace změn nákladů.

Základní model:

    ES raw cost
    × AG topology
    + CS business overhead
    = customer price

Pricing musí být auditovatelný.

Každý výpočet ceny musí být vysvětlitelný přes pricing trace.

---

## 7. Simulation / Impact Analysis Service

Odpovědnost:

- simulace změn infrastruktury,
- simulace změn SLA,
- simulace změn nákladů,
- dopad změny ES do AG,
- dopad změny AG do CS,
- what-if scénáře.

Příklady:

- změna ceny serverového typu,
- výpadek lokality,
- přidání redundancy group,
- změna SLA profilu,
- změna business overhead.

---

## 8. Integration Layer

Odpovědnost:

- integrace s CMDB,
- integrace s monitoring systémy,
- export pricing modelů,
- synchronizace referenčních dat,
- reconciliation,
- conflict detection.

Source-of-truth boundary:

- CMDB vlastní technologickou evidenci konkrétních objektů.
- Catalog Services systém vlastní katalogové typy, kompozice, costing, SLA a business nabídku.
- Monitoring poskytuje provozní fakta, ale nenahrazuje katalog ani SLA engine.

---

## 9. Web Application

Odpovědnost:

- správa ES katalogu,
- skládání AG služeb,
- správa CS nabídky,
- kalkulace ceny,
- simulace změn,
- review pricing/SLA trace,
- lifecycle workflow,
- import/export JSON.

Webová aplikace má minimálně tyto pracovní oblasti:

- ES Catalog Console,
- AG Composition Workspace,
- CS Offering Workspace,
- Pricing Workspace,
- SLA Workspace,
- Simulation Workspace,
- Integration Operations Console.

---

# Hlavní vztahy

## ES → AG

Agregační služby skládají elementární služby.

Vazba ES → AG obsahuje:

- typ ES,
- referenci na ES položku,
- quantity,
- topology role,
- redundancy group,
- mandatory flag.

Příklad:

    Publikační platforma HA
    =
    2× Lokalita
    2× Router
    2× WAN linka
    2× F5
    1× Monitoring profile

AG z ES přebírá:

- technické capability,
- raw cost,
- availability vstupy,
- provozní omezení.

---

## AG → CS

Zákaznické služby využívají agregační služby.

CS přidává:

- business SLA,
- business overhead,
- zákaznický popis,
- volitelné operace,
- governance.

Příklad:

    Publikovaná aplikace GOLD
    =
    Publikační platforma HA
    +
    24x7 support
    +
    Reporting
    +
    Security governance

---

## SLA inheritance

SLA nevzniká na úrovni ES.

SLA vzniká z AG vrstvy podle:

- redundancy,
- topology,
- geografické distribuce,
- HA modelu,
- mandatory/optional prvků,
- failure impact pravidel.

CS může SLA businessově prezentovat, ale nemá ji vytvářet bez technického základu.

---

## Pricing inheritance

Pricing vychází z vícevrstvého modelu:

- ES poskytuje raw cost.
- AG určuje topology multiplier a množství.
- CS přidává business overhead a volitelné business operace.

Výpočet musí být:

- verzovaný,
- auditovatelný,
- vysvětlitelný,
- reprodukovatelný.

---

# Datový model

## Princip návrhu

Datový model je založen na principu:

    ArchiMate objekt = katalogový list = databázová entita / typová položka

Neexistuje jedna univerzální tabulka pro všechny služby.

Každý významný typ objektu má:

- vlastní katalogový list,
- vlastní atributy,
- vlastní costing model,
- vlastní operational profile,
- vlastní lifecycle.

Výhody:

- kompatibilita s enterprise architekturou,
- kompatibilita s CMDB,
- auditovatelnost,
- jasné ownership,
- rozšiřitelnost,
- lepší validace.

---

## Katalogové typy vs runtime instance

Systém v aktuálním scope primárně modeluje:

- katalogové typy,
- katalogové listy,
- kompozice služeb,
- pricing/SLA profily,
- dependency modely.

Systém zatím nemodeluje plnohodnotně:

- zákaznické subscription,
- objednávkové instance,
- provisioning runs,
- fakturaci,
- incidenty.

Datový model však má být připraven pro budoucí napojení objednávkového portálu a provisioning workflow.

---

# Lifecycle a versioning

Každý katalogový objekt musí mít lifecycle.

Typické stavy:

- draft,
- in_review,
- approved,
- published,
- deprecated,
- retired.

Lifecycle se týká:

- ES typů,
- AG typů,
- CS typů,
- pricing profilů,
- SLA profilů,
- JSON schémat,
- import/export kontraktů.

Změny musí být verzované.

Změna ES může mít dopad na:

- AG kompozice,
- SLA výpočty,
- CS pricing,
- publikované katalogové nabídky.

Proto systém musí podporovat impact analysis před publikací změny.

---

# Import / export JSON

Systém musí podporovat import a export do JSON pro:

- elementární položky,
- agregační položky,
- zákaznické služby,
- pricing profily,
- SLA profily,
- dependency modely,
- simulation scénáře.

JSON kontrakty musí být:

- verzované,
- validovatelné,
- zpětně dohledatelné,
- použitelné pro migraci i integraci.

Import nesmí tiše přepsat publikovaná data bez lifecycle pravidel.

---

# API a integrační kontrakty

Architektura předpokládá API pro:

- správu ES katalogu,
- správu AG katalogu,
- správu CS katalogu,
- výpočet pricing,
- výpočet SLA,
- simulace,
- import/export JSON,
- integraci s CMDB,
- integraci s monitoringem.

API musí definovat:

- resource model,
- request/response schema,
- error model,
- idempotency pravidla,
- auth/authz model,
- versioning,
- audit trail.

---

# Databázové schéma

## Filosofie návrhu tabulek

Datový model je navržen podle principu:

```text
ArchiMate objekt = katalogový list = databázová entita
```

Neexistuje:
- jedna univerzální tabulka pro všechny služby.

Každý významný objekt:
- má vlastní tabulku,
- vlastní atributy,
- vlastní costing model,
- vlastní operational profile.

Výhody:
- kompatibilita s enterprise architekturou,
- kompatibilita s CMDB,
- jednoduché rozšiřování,
- auditovatelnost,
- jasné ownership.

---

## SQLITE3 databázové schéma

```sql
-- =========================
-- ELEMENTÁRNÍ SLUŽBY
-- Typové katalogové položky, ne konkrétní instance
-- =========================

CREATE TABLE es_location (
    location_type_id TEXT PRIMARY KEY,
    location_type_name TEXT NOT NULL,
    geo_redundancy_supported BOOLEAN DEFAULT 0,
    power_redundancy_supported BOOLEAN DEFAULT 0,
    cooling_redundancy_supported BOOLEAN DEFAULT 0,
    physical_security_level TEXT
    CHECK (
        physical_security_level IN (
            'basic',
            'standard',
            'high',
            'critical'
        )
    ),
    monthly_cost REAL NOT NULL
);

CREATE TABLE es_rack (
    rack_type_id TEXT PRIMARY KEY,
    rack_type_name TEXT NOT NULL,
    rack_units_min INTEGER,
    rack_units_max INTEGER,
    power_kw_min REAL,
    power_kw_max REAL,
    monthly_cost REAL
);

CREATE TABLE es_wan_link (
    wan_link_type_id TEXT PRIMARY KEY,
    wan_link_type_name TEXT NOT NULL,
    bandwidth_mbps_min INTEGER,
    bandwidth_mbps_max INTEGER,
    latency_ms_max INTEGER,
    redundancy_supported BOOLEAN DEFAULT 0,
    monthly_cost REAL
);

CREATE TABLE es_server (
    server_type_id TEXT PRIMARY KEY,
    server_type_name TEXT NOT NULL,
    cpu_count_min INTEGER NOT NULL,
    cpu_count_max INTEGER NOT NULL,
    ram_gb_min INTEGER NOT NULL,
    ram_gb_max INTEGER NOT NULL,
    storage_tb_min REAL NOT NULL,
    storage_tb_max REAL NOT NULL,
    monthly_cost REAL NOT NULL DEFAULT 0,

    CHECK (cpu_count_min <= cpu_count_max),
    CHECK (ram_gb_min <= ram_gb_max),
    CHECK (storage_tb_min <= storage_tb_max)
);

CREATE TABLE es_router (
    router_type_id TEXT PRIMARY KEY,
    router_type_name TEXT NOT NULL,
    throughput_gbps_min REAL,
    throughput_gbps_max REAL,
    bgp_supported BOOLEAN DEFAULT 0,
    ipv6_supported BOOLEAN DEFAULT 0,
    nat_supported BOOLEAN DEFAULT 0,
    monthly_cost REAL
);

CREATE TABLE es_virtualization (
    virtualization_type_id TEXT PRIMARY KEY,
    virtualization_type_name TEXT NOT NULL,
    hypervisor_type TEXT,
    ha_supported BOOLEAN DEFAULT 0,
    live_migration_supported BOOLEAN DEFAULT 0,
    cluster_supported BOOLEAN DEFAULT 0,
    monthly_cost REAL
);

CREATE TABLE es_containerization (
    containerization_type_id TEXT PRIMARY KEY,
    containerization_type_name TEXT NOT NULL,
    orchestrator_type TEXT,
    autoscaling_supported BOOLEAN NOT NULL DEFAULT 0,
    ingress_supported BOOLEAN NOT NULL DEFAULT 0,
    multi_tenant_supported BOOLEAN NOT NULL DEFAULT 0,
    monthly_cost REAL NOT NULL DEFAULT 0
);

-- =========================
-- AGREGAČNÍ SLUŽBY
-- Typ agregační služby + její složení z elementárních typů
-- =========================

CREATE TABLE ag_service (
    ag_id TEXT PRIMARY KEY,
    ag_name TEXT NOT NULL,
    category TEXT,
    description TEXT,
    sla_profile TEXT,
    availability REAL
);

CREATE TABLE ag_service_item (
    ag_item_id TEXT PRIMARY KEY,
    ag_id TEXT NOT NULL,
    es_type TEXT NOT NULL,
    es_reference_id TEXT NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    topology_role TEXT,
    redundancy_group TEXT,
    mandatory BOOLEAN DEFAULT 1,
    FOREIGN KEY (ag_id)
        REFERENCES ag_service(ag_id)

);

-- es_category říká, do které ES tabulky se es_type_id vztahuje:
-- location / rack / wan_link / server / router / virtualization / containerization

-- =========================
-- ZÁKAZNICKÉ SLUŽBY
-- Objednatelné business produkty nad agregačními službami
-- =========================

CREATE TABLE cs_service (
    cs_id TEXT PRIMARY KEY,
    cs_name TEXT NOT NULL,
    business_owner TEXT,
    service_unit TEXT,
    pricing_profile TEXT,
    description TEXT
);

CREATE TABLE cs_service_ag_dependency (
    cs_dependency_id TEXT PRIMARY KEY,
    cs_id TEXT NOT NULL,
    ag_id TEXT NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    mandatory INTEGER DEFAULT 1,

    FOREIGN KEY (cs_id) REFERENCES cs_service(cs_id),
    FOREIGN KEY (ag_id) REFERENCES ag_service(ag_id)
);

CREATE TABLE cs_service_option (
    option_id TEXT PRIMARY KEY,
    cs_id TEXT NOT NULL,
    option_name TEXT NOT NULL,
    option_description TEXT,
    unit TEXT,
    unit_price REAL,
    optional INTEGER DEFAULT 1,

    FOREIGN KEY (cs_id) REFERENCES cs_service(cs_id)
);

```

---

# ArchiMate model

## Účel

ArchiMate model slouží jako formální projekce služby a její kompozice.

Model není source of truth místo SPEC, ale musí být dohledatelný na katalogové položky.

## Hlavní pohledy

### 1. Motivation View

Obsahuje:

- stakeholdery,
- cíle,
- principy,
- omezení,
- requirements,
- ADR rozhodnutí.

### 2. Technology Layer View

Obsahuje:

- elementární služby,
- inventory objekty,
- lokality,
- zařízení,
- runtime nodes.

### 3. Application Layer View

Obsahuje:

- agregační služby,
- runtime composition,
- SLA model,
- availability model,
- topology model.

### 4. Business Layer View

Obsahuje:

- zákaznické služby,
- business products,
- pricing model,
- SLA offerings.

### 5. Service Composition View

Obsahuje:

- ES → AG → CS dependency graph,
- SLA inheritance,
- pricing inheritance.

### 6. Pricing View

Obsahuje:

- ES raw cost,
- AG topology costing,
- CS business overhead,
- customer price.

### 7. Runtime Topology View

Obsahuje:

- redundancy groups,
- HA topology,
- DR topology,
- locality distribution.

### 8. Change Impact View

Obsahuje:

- dopad změn infrastruktury,
- dopad změn SLA,
- costing impact,
- dependency impact.

---

# Regeneration relevance

Architektura musí být dostatečně přesná pro budoucí regeneraci:

- komponentového modelu,
- databázového modelu,
- API kontraktů,
- JSON schémat,
- pricing engine,
- SLA engine,
- ArchiMate modelu,
- validačních pravidel.

Každá schopnost deklarovaná v architektuře musí mít později odpovídající:

- komponentu,
- datový model,
- API kontrakt,
- validační pravidlo,
- lifecycle pravidlo,
- traceability vazbu.
---

# Canonical contracts overview

Canonical contracts jsou deployment-neutral artefakty, které uzavírají významové boundary systému.

V systému `catalog-services` jsou canonical contracts povinné pro:
- pricing,
- SLA,
- lifecycle,
- publication,
- ownership,
- validation,
- import/export.

Každý canonical contract musí mít:
- identifier,
- verzi,
- ownera,
- approval role,
- normative rules,
- persistence implications.

Contracts nejsou fake API design.
Contracts neurčují endpointy, transport ani deployment.
Contracts určují významové a governance hranice systému.

---

# Logical modules vs deployment-neutral capabilities

Architektura rozlišuje:

- **logical capability** — významová schopnost systému,
- **component** — modelovaná architektonická jednotka ve SPEC,
- **deployment unit** — budoucí implementační rozhodnutí mimo tento SPEC.

Tento SPEC definuje logical capabilities a komponentové boundary.
Tento SPEC vědomě nedefinuje fyzický deployment model.

To znamená:
- Pricing Engine je canonical capability,
- SLA Engine je canonical capability,
- Contract Governance je canonical capability,
- ale SPEC neurčuje, zda půjde o samostatné služby, moduly nebo jinou implementační formu.

---

# Persistence domains and cross-cutting records

Pro bezpečnou implementaci a regeneraci musí být persistence chápána jako sada logických domén, nikoliv jen jednotlivé tabulky.

Povinné logické persistence domény:
- katalogové typy ES,
- katalogové typy AG,
- katalogové typy CS,
- pricing profiles,
- SLA profiles,
- lifecycle history,
- publication records,
- owner assignments,
- validation rule sets,
- validation runs,
- pricing traces,
- SLA traces,
- import/export history.

Cross-cutting records musí minimálně podporovat:
- version references,
- audit evidence,
- approval evidence,
- traceability evidence.

SPEC tímto neurčuje fyzický storage engine.
Určuje pouze logické persistence boundary, které nesmí být v implementaci ztraceny.

---

# Traceability and publication boundaries

Každá publishable schopnost deklarovaná v architektuře musí být dohledatelná na:
- source SPEC artefakt,
- canonical contract, pokud je relevantní,
- validační pravidla,
- lifecycle pravidla,
- ownership assignment.

Aggregated SPEC view je publishable artifact pouze tehdy, pokud:
- je synchronizovaný se source SPEC,
- odráží schválené contracts a governance,
- neobsahuje stale nebo placeholder části v publishable sekcích.

---

# Change propagation across ES → AG → CS

## ES change propagation
Změna ES musí být posouzena na dopad do:
- AG composition,
- pricing input chain,
- availability input chain,
- import/export compatibility.

## AG change propagation
Změna AG musí být posouzena na dopad do:
- CS offering modelu,
- SLA evaluation,
- pricing topology semantics,
- simulation scenarios.

## CS change propagation
Změna CS musí být posouzena na dopad do:
- publication readiness,
- pricing outputs,
- order-readiness artefaktů.

## Contract change propagation
Změna contractu musí být posouzena na dopad do:
- validation layer,
- regeneration rules,
- aggregated SPEC,
- implementation planning inputs.
