---
title: "Specifikace projektu: catalog-services"
date: "2026-05-17"
lang: cs-CZ
toc: true
numbersections: false
---

# Přehled

Tento dokument je generovaný view dokument složený z kanonických artefaktů projektu `catalog-services`.


# Meta

```yaml
meta:
  id: catalog-services
  name: catalog-services

  type: system # system | feature | tool
  status: draft # draft | active | archived

  owner: Radim
  canonical_version: 0.1

  created: 2026-05-15
  updated: 2026-05-15

links:
  roam_project: "PO/catalog-services"
  code_repositories: []
  related_specs: []
  archimate_model: ""

```


# Motivace

```yaml
motivation:
  stakeholders:
    - name: Management organizace
      role: Definuje strategii služeb, schvaluje investice, SLA a provozní model

    - name: Finanční oddělení
      role: Odpovídá za costing, chargeback, forecasting a ekonomické řízení služeb

    - name: Enterprise architekt
      role: Navrhuje metamodel služeb, vazby mezi objekty a dlouhodobou architekturu

    - name: Provozní tým infrastruktury
      role: Provozuje elementární služby a odpovídá za jejich dostupnost

    - name: Service manager
      role: Definuje agregační a zákaznické služby a jejich SLA

    - name: Aplikační tým
      role: Konzumuje zákaznické služby a objednává provozní capability

    - name: Bezpečnostní tým
      role: Definuje bezpečnostní požadavky, governance a dohled

    - name: Dodavatelé technologií
      role: Dodávají hardware, software a podporu elementárních služeb

  drivers:
    - Potřeba standardizace provozu infrastruktury a služeb
    - Potřeba transparentního costing modelu
    - Potřeba měřitelného a auditovatelného service modelu
    - Potřeba sjednocení architektonického modelu a katalogu služeb
    - Potřeba řídit SLA a dostupnost služeb systematicky
    - Potřeba opakovatelně skládat služby ze standardních stavebních jednotek
    - Potřeba automatizovat kalkulaci ceny služeb
    - Potřeba řídit změny infrastruktury finančně i provozně
    - Potřeba zavést jednotný model pro provisioning a objednávky služeb
    - Potřeba oddělit technologické objekty od business služeb

  assessment:
    - Současný katalog služeb míchá technologické capability, platformy a business služby
    - Současný model není dostatečně měřitelný pro costing a forecasting
    - Současný model neumožňuje jednoduché inventory-driven oceňování
    - SLA nejsou systematicky odvozována z topologie a redundance
    - Chybí jednotný model vazeb mezi architekturou, CMDB a katalogem služeb
    - Technologické platformy jsou obtížně mapovatelné na business služby
    - Chybí standardní model pro skládání agregačních služeb
    - Pricing je příliš navázán na technologickou implementaci
    - Chybí jednotná evidence provozních stavebních objektů
    - Chybí jednotný model pro změnové řízení nákladů
    - Chybí automatizovatelný model pro výpočet dostupnosti služeb

  goals:
    - Zavést jednotný service model založený na ArchiMate objektovém metamodelu
    - Definovat elementární služby jako standardizované stavební objekty
    - Definovat agregační služby jako runtime kompozice elementárních služeb
    - Definovat zákaznické služby jako objednatelné business produkty
    - Zavést inventory-driven costing model
    - Umožnit automatizovaný výpočet ceny zákaznických služeb
    - Umožnit automatizovaný výpočet SLA a dostupnosti
    - Zavést jednotný model dependency mezi službami
    - Zavést jednotný model pro změnové řízení služeb
    - Umožnit jednoduché přidávání nových technologických objektů
    - Umožnit jednoduché skládání nových agregačních služeb
    - Zajistit auditovatelnost všech nákladových a SLA výpočtů
    - Propojit architektonický model, CMDB a katalog služeb
    - Připravit datový model pro budoucí webovou aplikaci a provisioning

  constraints:
    - Systém musí respektovat existující ArchiMate metamodel organizace
    - Systém musí být dlouhodobě provozně udržitelný
    - Systém nesmí být závislý na konkrétním vendorovi
    - Systém musí podporovat změnové řízení infrastruktury
    - Systém musí umožnit audit finančních výpočtů
    - Systém musí umožnit rozšiřování katalogu bez redesignu databáze
    - Elementární služby nesmí obsahovat business SLA
    - Zákazník nesmí konfigurovat interní provozní operace elementárních služeb
    - Monitoring, patching, backup a logging jsou inherentní součástí elementárních služeb
    - SLA musí vznikat z topologie agregačních služeb
    - Cena zákaznické služby musí být odvoditelná z elementárních a agregačních služeb
    - Agregační služby nesmí vytvářet duplicitní costing
    - Model musí podporovat budoucí automatizaci provisioning workflow

  principles:
    - ArchiMate objekt odpovídá katalogovému listu a databázové entitě
    - Elementární služby představují standardizované provozní stavební jednotky
    - Elementární služby jsou inventory-driven a měřitelné
    - Agregační služby představují runtime kompozici elementárních služeb
    - SLA vzniká z redundance a topologie agregačních služeb
    - Zákaznické služby představují objednatelné business produkty
    - Technologické provozní operace jsou inherentní součástí elementárních služeb
    - Business overhead vzniká pouze na úrovni zákaznických služeb
    - Pricing musí být auditovatelný a vysvětlitelný
    - Každá změna infrastruktury musí mít jednoznačný finanční dopad
    - Model musí podporovat automatizované skládání služeb
    - Model musí oddělovat technologickou implementaci od business prezentace
    - Agregační služby nesmí obsahovat duplicitní business costing
    - Každá vyšší vrstva musí být odvoditelná z nižší vrstvy

  requirements:
    - Systém musí evidovat katalog elementárních služeb
    - Systém musí evidovat katalog agregačních služeb
    - Systém musí evidovat katalog zákaznických služeb
    - Systém musí evidovat vazby mezi elementárními a agregačními službami
    - Systém musí evidovat vazby mezi agregačními a zákaznickými službami
    - Systém musí umožnit definovat topology a redundancy groups
    - Systém musí umožnit definovat SLA profily
    - Systém musí automaticky počítat dostupnost agregačních služeb
    - Systém musí automaticky počítat cenu zákaznických služeb
    - Systém musí podporovat versioning katalogových listů
    - Systém musí podporovat lifecycle management služeb
    - Systém musí podporovat inventory-based costing
    - Systém musí podporovat evidenci provozních atributů objektů
    - Systém musí podporovat evidenci business atributů služeb
    - Systém musí umožnit simulaci změn infrastruktury
    - Systém musí umožnit simulaci změn SLA
    - Systém musí podporovat export pricing modelu pro finance
    - Systém musí podporovat budoucí provisioning workflow
    - Systém musí poskytovat API pro integraci s CMDB a monitoringem
    - Systém musí umožnit budoucí implementaci webové aplikace pro objednávku služeb

```


# Scope:

## Účel:
    Systém slouží pro evidenci, skládání, oceňování a správu podnikových služeb
    založených na vícevrstvém service modelu.

    Systém propojuje:
    - architektonický model,
    - katalog služeb,
    - inventory technologických objektů,
    - SLA model,
    - costing model,
    - zákaznické služby.

    Systém umožňuje:
    - definovat elementární služby jako standardizované stavební objekty,
    - skládat agregační služby z elementárních služeb,
    - vytvářet zákaznické služby nad agregačními službami,
    - automaticky odvozovat SLA a dostupnost,
    - automaticky počítat cenu služeb,
    - simulovat změny infrastruktury a jejich finanční dopad.

## in_scope:
    - Evidence katalogových listů elementárních služeb
    - Evidence katalogových listů agregačních služeb
    - Evidence katalogových listů zákaznických služeb
    - Správa ArchiMate objektového modelu relevantního pro služby
    - Vazby mezi elementárními, agregačními a zákaznickými službami
    - Runtime kompozice agregačních služeb
    - Definice topology a redundancy modelu
    - Definice SLA profilů
    - Výpočet dostupnosti agregačních služeb
    - Výpočet ceny zákaznických služeb
    - Inventory-driven costing model
    - Správa provozních atributů technologických objektů
    - Správa business atributů zákaznických služeb
    - Definice volitelných business operací zákaznických služeb
    - Simulace změn infrastruktury
    - Simulace změn SLA
    - Simulace změn nákladů
    - Lifecycle management katalogových objektů
    - Versioning katalogových listů
    - Export pricing modelu pro finanční oddělení
    - API pro integraci s CMDB
    - API pro integraci s monitoring systémy
    - Příprava datového modelu pro provisioning workflow
    - Příprava datového modelu pro budoucí objednávkový portál
    - Webová aplikace pro správu katalogových objektů
    - Webová aplikace pro skládání agregačních služeb
    - Webová aplikace pro kalkulaci ceny zákaznických služeb

## out_of_scope:
    - Real-time monitoring infrastruktury
    - Nahrazení CMDB systému
    - Nahrazení monitoring systému
    - Nahrazení ITSM nástroje
    - Automatické provisioning workflow infrastruktury
    - Automatické deployment workflow aplikací
    - Orchestrace Kubernetes nebo virtualizace
    - Technická konfigurace síťových prvků
    - Technická konfigurace serverů
    - Billing externích zákazníků
    - Fakturace
    - Asset management mimo služby
    - Procurement management
    - Správa smluv s dodavateli
    - Správa incidentů a requestů
    - SIEM funkcionalita
    - Security operations
    - IAM implementace
    - Capacity monitoring v reálném čase
    - Performance monitoring aplikací
    - Detailní technická dokumentace infrastruktury
    - Nahrazení enterprise architektonického repository

## non_goals:
    - Cílem není vytvořit další CMDB systém
    - Cílem není vytvořit hyperscaler cloud platformu
    - Cílem není modelovat kompletní enterprise architekturu organizace
    - Cílem není detailní technická evidence všech konfigurací
    - Cílem není nahrazení provozních nástrojů infrastruktury
    - Cílem není vytvořit univerzální ITIL katalog
    - Cílem není modelovat všechny interní procesy organizace
    - Cílem není vytvořit billing systém pro externí zákazníky
    - Cílem není řešit deployment automation
    - Cílem není řešit orchestration engine
    - Cílem není umožnit zákazníkovi konfigurovat interní provozní operace
    - Cílem není účtovat jednotlivé technologické capability samostatně
    - Cílem není modelovat každou technologickou komponentu jako business službu
    - Cílem není vytvořit vendor-specific model infrastruktury
    - Cílem není řešit low-level network nebo server management


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


















# Komponenty

```yaml
components:
  - id: example_component
    name: Example Component

    type: application_component # application_component | data_object | service
    layer: application # business | application | technology

    purpose: Popis účelu komponenty

    responsibilities:
      - odpovědnost 1
      - odpovědnost 2

    interfaces:
      - api
      - cli

relations:
  - source: example_component
    target: another_component

    type: association # association | flow | access | serving
    description: vztah mezi komponentami

```


# Rozhodnutí

---

## ADR-001: Název rozhodnutí

### Stav
Navrženo | Schváleno | Zrušeno

### Kontext
Jaký problém řešíme

### Rozhodnutí
Jak jsme se rozhodli

### Důsledky
Co to znamená pro systém

---

# Rozhodnutí

## ADR-001: Oddělení elementárních, agregačních a zákaznických služeb

### Stav  
Schváleno

### Kontext
Původní návrh katalogu služeb míchal technologické capability,
platformy a business služby do jedné vrstvy.

Tento přístup vedl:
- k nejasnému costing modelu,
- k nemožnosti auditovat SLA,
- k duplicitnímu oceňování,
- k nejasným dependency mezi službami,
- k obtížné správě katalogu.

Bylo potřeba zavést jednoznačný vícevrstvý model služeb.

### Rozhodnutí
Služby budou rozděleny do tří vrstev:

- Elementární služby:
  standardizované technologické stavební jednotky

- Agregační služby:
  runtime kompozice elementárních služeb

- Zákaznické služby:
  objednatelné business produkty

Každá vrstva má jasně definovanou odpovědnost,
costing model a SLA model.

### Důsledky
Elementární služby jsou inventory-driven a měřitelné.

Agregační služby definují:
- topology,
- redundanci,
- SLA,
- dostupnost.

Zákaznické služby definují:
- business prezentaci,
- business SLA,
- pricing,
- volitelné business operace.

Systém získává:
- auditovatelný costing,
- jasné dependency,
- jednoduchý change management,
- škálovatelný service model.

## ADR-002 ArchiMate objekt odpovídá katalogovému listu

### Stav  
Schváleno

### Kontext
Původní návrh předpokládal jednu univerzální tabulku
pro všechny elementární služby.

Tento přístup by vedl:
- ke ztrátě významu objektového modelu,
- k příliš obecné databázové struktuře,
- ke komplikovanému rozšiřování atributů,
- ke špatné mapovatelnosti na enterprise architekturu.

### Rozhodnutí
Každý významný ArchiMate objekt bude reprezentován:
- katalogovým listem,
- databázovou entitou,
- elementární stavební jednotkou.

Například:
- Lokalita,
- Server,
- Router,
- WAN linka,
- Virtualizační platforma,
- Kontejnerizační platforma.

### Důsledky
Datový model bude:
- srozumitelný,
- rozšiřitelný,
- kompatibilní s enterprise architekturou,
- vhodný pro CMDB integraci.

Katalog služeb bude přímo mapovatelný
na architektonický model organizace.

## ADR-003 SLA vzniká až na úrovni agregačních služeb

### Stav  
Schváleno

### Kontext
Původní návrhy přiřazovaly SLA přímo elementárním službám.

Tento přístup neumožňoval správně modelovat:
- redundanci,
- vysokou dostupnost,
- disaster recovery,
- geografickou redundanci.

Například:
- jeden router negeneruje HA,
- jedna lokalita negeneruje SLA 99.9.

### Rozhodnutí
SLA nebude definováno na úrovni elementárních služeb.

SLA vzniká:
- z topologie agregační služby,
- z redundance,
- z počtu lokalit,
- z počtu linek,
- z HA modelu.

Agregační služby budou obsahovat:
- topology model,
- redundancy groups,
- availability profile.

### Důsledky
SLA model bude:
- realistický,
- auditovatelný,
- automatizovatelný.

Systém bude schopen:
- automaticky odvozovat SLA,
- simulovat dopady změn infrastruktury,
- simulovat dopady ztráty redundancy.

## ADR-004 Monitoring, patching a backup jsou inherentní součástí elementárních služeb

### Stav  
Schváleno

### Kontext
Původní návrhy umožňovaly modelovat:
- monitoring,
- patching,
- backup,
- logging

jako samostatně objednatelné capability.

To vedlo:
- ke komplikovanému katalogu,
- k nejasné odpovědnosti,
- k nekonzistentnímu provozu,
- k provoznímu riziku.

### Rozhodnutí
Monitoring, patching, backup a logging
jsou inherentní provozní součástí elementárních služeb.

Zákazník tyto capability:
- neobjednává,
- nekonfiguruje,
- nemůže odmítnout.

Tyto operace jsou definovány
v operational profile elementární služby.

### Důsledky
Service model bude:
- jednodušší,
- konzistentnější,
- provozně bezpečnější.

Zákaznické služby budou obsahovat
pouze business-level operace a volby.

## ADR-005 Inventory-driven costing model

### Stav  
Schváleno

### Kontext
Organizace potřebuje:
- auditovatelný costing,
- forecasting,
- jednoduchý pricing model,
- simulaci změn infrastruktury.

Původní capability-oriented model
nebyl dostatečně měřitelný.

### Rozhodnutí
Costing bude založen na:
- inventory objektech,
- počtech jednotek,
- kategoriích zařízení,
- lokalitách,
- support profilech.

Elementární služby budou obsahovat:
- raw operational cost.

Agregační služby:
- topology,
- composition,
- SLA inheritance.

Zákaznické služby:
- business overhead,
- finální pricing.

### Důsledky
Systém umožní:
- jednoduchý change costing,
- forecasting,
- simulace rozšíření infrastruktury,
- simulace SLA změn.

Finanční oddělení získá:
- transparentní costing chain,
- auditovatelné výpočty,
- jednoduchý pricing model.

## ADR-006 Agregační služby nejsou samostatně obchodně oceňované

### Stav  
Schváleno

### Kontext
Během návrhu vzniklo riziko duplicitního costing modelu.

Agregační služby začaly obsahovat:
- support overhead,
- governance,
- business pricing.

To vedlo:
- k dvojímu účtování,
- k nejasnému ownership,
- k nejasné business vrstvě.

### Rozhodnutí
Agregační služby nejsou samostatně obchodně oceňované.

Agregační služby slouží pouze jako:
- runtime blueprint,
- topology definition,
- SLA composition layer.

Finální business pricing vzniká
až na úrovni zákaznických služeb.

### Důsledky
Model zůstává:
- transparentní,
- bez duplicitního costing,
- jednoduše vysvětlitelný.

Agregační služby budou:
- technickou vrstvou,
- nikoliv obchodním produktem.


# Vazby

```yaml
links:
  roam:
    project_page: "PO/..."

  local_paths:
    project_root: "~/Projects/catalog-services"
    spec_root: "~/SpecSystem/projects/catalog-services"

  repositories:
    - url: https://github.com/...
      description: hlavní repo

  services:
    - name: VPS
      type: infra
      provider: Hetzner

```


# Regenerace

## Princip
Systém je regenerovatelný ze specifikace.

## Vstupy pro regeneraci
- specifikace
- kontext
- data

## Regenerovatelné části
- backend
- frontend
- testy

## Neregenerovatelné části
- data
- externí integrace

## Pravidla
- malé komponenty
- jasné hranice
- izolace změn

## Triggery regenerace
- změna specifikace
- pokles metrik
- refactoring










# Historie

---

## v0.1

### Změna
Inicializace projektu

### Důvod
Založení specifikace

---

## v0.x

### Změna
...

### Důvod
...





