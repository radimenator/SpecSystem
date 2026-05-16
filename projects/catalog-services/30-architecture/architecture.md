# Architektura

## Účel architektury

Architektura systému je navržena jako vícevrstvý service composition model,
který propojuje:

- enterprise architekturu,
- katalog služeb,
- inventory technologických objektů,
- SLA model,
- costing model,
- zákaznické služby.

Architektura vychází z principu:

```text
ArchiMate objekt
→ katalogový list
→ elementární služba
→ agregační služba
→ zákaznická služba
→ pricing
```

Cílem architektury je:

- standardizovat technologické stavební objekty,
- umožnit skládání agregačních služeb,
- automatizovat výpočet SLA,
- automatizovat pricing,
- zajistit auditovatelnost costing modelu,
- propojit enterprise architekturu s provozním modelem,
- umožnit budoucí provisioning a objednávkový portál.

Architektura je navržena jako:
- inventory-driven,
- service-oriented,
- topology-aware,
- SLA-aware,
- pricing-aware.

---

# Architektonické vrstvy

## Motivation

Vrstva Motivation popisuje:
- stakeholdery,
- business cíle,
- omezení,
- principy,
- požadavky,
- architektonická rozhodnutí.

Obsahuje:
- ADR rozhodnutí,
- service governance,
- costing principy,
- SLA principy,
- provozní principy.

---

## Business

Business vrstva reprezentuje:
- zákaznické služby,
- business produkty,
- SLA,
- pricing,
- business operace,
- objednávkové capability.

Business vrstva:
- nekonzumuje infrastrukturu přímo,
- využívá agregační služby,
- prezentuje business hodnotu.

Příklady:
- Publikovaná aplikace
- VDI Workspace
- DR Application
- HA Hosting

---

## Application

Application vrstva reprezentuje:
- agregační služby,
- runtime kompozice,
- topology model,
- availability model,
- SLA inheritance,
- pricing orchestration.

Application vrstva:
- skládá elementární služby,
- definuje redundanci,
- odvozuje SLA,
- poskytuje runtime capability.

Příklady:
- Publikační platforma
- Virtualizační cluster
- Security Monitoring
- Backup Platform
- Application Delivery Platform

---

## Technology

Technology vrstva reprezentuje:
- elementární služby,
- inventory objekty,
- technologické stavební jednotky.

Každý významný ArchiMate objekt:
- odpovídá katalogovému listu,
- odpovídá databázové entitě,
- odpovídá elementární službě.

Příklady:
- Lokalita
- Rack
- Server
- Router
- WAN linka
- Virtualizační node
- Kubernetes node
- F5 appliance

---

# Hlavní komponenty

## 1. Katalog elementárních služeb

Odpovědnost:
- evidence technologických stavebních objektů,
- inventory-driven costing,
- operational profile,
- lifecycle management.

Obsahuje:
- lokality,
- zařízení,
- servery,
- linky,
- platform nodes,
- runtime objekty.

---

## 2. Katalog agregačních služeb

Odpovědnost:
- runtime composition,
- topology model,
- redundancy model,
- SLA inheritance,
- availability calculation.

Obsahuje:
- kompozice elementárních služeb,
- redundancy groups,
- topology rules,
- SLA profiles.

---

## 3. Katalog zákaznických služeb

Odpovědnost:
- business produkty,
- business pricing,
- business SLA,
- volitelné business operace.

Obsahuje:
- business offerings,
- business overhead,
- pricing rules,
- customer options.

---

## 4. SLA Engine

Odpovědnost:
- výpočet SLA,
- výpočet dostupnosti,
- odvození redundancy impact,
- simulace výpadků.

Výpočet probíhá:
- z topology modelu,
- z redundancy groups,
- z počtu lokalit,
- z počtu linek,
- z HA modelu.

---

## 5. Pricing Engine

Odpovědnost:
- výpočet ceny zákaznických služeb,
- costing inheritance,
- business overhead calculation,
- simulace změn.

Pricing model:

```text
ES raw cost
× AG topology
+ CS business overhead
= customer price
```

---

## 6. Web Application

Odpovědnost:
- správa katalogových listů,
- skládání agregačních služeb,
- kalkulace ceny,
- simulace změn,
- objednávka zákaznických služeb.

---

## 7. Integration Layer

Odpovědnost:
- integrace s CMDB,
- integrace s monitoring systémy,
- integrace s provisioning workflow,
- export pricing modelů.

---

# Hlavní vztahy

## Elementární → Agregační

Agregační služby:
- skládají elementární služby,
- definují topology,
- definují redundanci,
- definují runtime composition.

Příklad:

```text
Publikační platforma
=
2× Lokalita
2× Router
2× WAN linka
2× F5
1× Monitoring profile
```

---

## Agregační → Zákaznické

Zákaznické služby:
- využívají agregační služby,
- přidávají business SLA,
- přidávají business operace,
- přidávají governance.

Příklad:

```text
Publikovaná aplikace GOLD
=
Publikační platforma HA
+
24x7 support
+
Reporting
+
Security governance
```

---

## SLA inheritance

SLA:
- nevzniká na úrovni elementárních služeb,
- vzniká až z runtime composition agregačních služeb.

Výsledné SLA je odvozeno:
- z redundancy,
- z topology,
- z geografické distribuce,
- z HA modelu.

---

## Pricing inheritance

Pricing:
- vychází z raw cost elementárních služeb,
- je násoben topology agregačních služeb,
- je doplněn business overhead zákaznických služeb.

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

## Nástroj

Archi

---

## Soubor

```text
upaas-service-model.archimate
```

---

## Hlavní pohledy

### 1. Motivation View

Obsahuje:
- stakeholdery,
- cíle,
- principy,
- omezení,
- requirements,
- ADR rozhodnutí.

---

### 2. Technology Layer View

Obsahuje:
- elementární služby,
- inventory objekty,
- lokality,
- zařízení,
- runtime nodes.

---

### 3. Application Layer View

Obsahuje:
- agregační služby,
- runtime composition,
- SLA model,
- availability model,
- topology model.

---

### 4. Business Layer View

Obsahuje:
- zákaznické služby,
- business products,
- pricing model,
- SLA offerings.

---

### 5. Service Composition View

Obsahuje:
- dependency graph,
- inheritance model,
- SLA inheritance,
- pricing inheritance.

---

### 6. Pricing View

Obsahuje:
- costing chain,
- resource costing,
- topology costing,
- business overhead.

---

### 7. Runtime Topology View

Obsahuje:
- redundancy groups,
- HA topology,
- DR topology,
- locality distribution.

---

### 8. Change Impact View

Obsahuje:
- dopad změn infrastruktury,
- dopad změn SLA,
- costing impact,
- dependency impact.