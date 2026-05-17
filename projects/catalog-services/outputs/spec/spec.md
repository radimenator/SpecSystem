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


# Scope

## Účel

Systém slouží pro evidenci, skládání, oceňování a správu podnikových služeb založených na vícevrstvém service modelu.

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

## Vymezení modelu

Systém v této fázi modeluje katalogové typy a jejich kompozice.

Primární modelované vrstvy jsou:

- ES = Elementární služby
- AG = Agregační služby
- CS = Zákaznické služby

### Elementární služby

Elementární služby představují standardizované stavební položky katalogu.

Typicky jde o technologické nebo provozní capability, například:

- server,
- databázový běh,
- síťová konektivita,
- storage,
- zálohování,
- monitoring,
- provozní podpora.

Elementární služba není samostatně zákaznicky oceňovaný produkt.

### Agregační služby

Agregační služby skládají elementární služby do technické kompozice.

Agregační služba definuje:

- použité elementární položky,
- topology,
- redundancy model,
- dependency graph,
- availability profile,
- provozní složení služby.

Příklad: UPAAS může být modelována jako agregační služba, pokud reprezentuje technickou platformní kompozici prostředí složenou z elementárních položek.

### Zákaznické služby

Zákaznické služby představují objednatelné nebo prezentovatelné business služby postavené nad agregačními službami.

Zákaznická služba přidává:

- business význam,
- business SLA,
- business overhead,
- volitelné business operace,
- zákaznický popis,
- finální cenu.

## Katalogové typy vs runtime instance

Systém v aktuálním scope modeluje především:

- katalogové typy,
- katalogové listy,
- kompozice služeb,
- pricing/SLA modely,
- dependency modely.

Systém v aktuálním scope nemodeluje plnohodnotně:

- objednávkové instance,
- zákaznické subscription,
- runtime provisioning,
- billing kontrakty,
- provozní incidenty,
- detailní runtime monitoring.

Datový model má být připraven tak, aby bylo možné v budoucnu navázat provisioning workflow a objednávkový portál.

## In scope

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
- Import elementárních položek ve formátu JSON
- Export elementárních položek ve formátu JSON
- Import agregačních položek ve formátu JSON
- Export agregačních položek ve formátu JSON
- Export pricing modelu pro finanční oddělení
- API pro integraci s CMDB
- API pro integraci s monitoring systémy
- Příprava datového modelu pro provisioning workflow
- Příprava datového modelu pro budoucí objednávkový portál
- Webová aplikace pro správu katalogových objektů
- Webová aplikace pro skládání agregačních služeb
- Webová aplikace pro kalkulaci ceny zákaznických služeb

## Out of scope

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

## Non-goals

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

## Hraniční rozhodnutí

### Runtime kompozice agregačních služeb

Runtime kompozice v tomto systému znamená modelované složení služby, nikoliv skutečné spuštění nebo orchestrace infrastruktury.

Systém tedy eviduje a vyhodnocuje:

- z čeho je služba složena,
- jaké má dependency,
- jaké má redundantní části,
- jaký má dostupnostní dopad,
- jaký má nákladový dopad.

Systém nespouští infrastrukturu.

### UPAAS

UPAAS je v tomto modelu primárně agregační služba, pokud reprezentuje technické prostředí složené z elementárních položek.

Nad UPAAS může vzniknout zákaznická služba, pokud má být prezentována jako objednatelný business produkt.

### JSON import/export

Import a export do JSON je součástí scope pro:

- elementární služby,
- agregační služby,
- zákaznické služby,
- pricing profily,
- SLA profily,
- dependency modely.

JSON formát musí být verzovaný a validovatelný.

## Regeneration relevance

Tento scope musí umožnit budoucí regeneraci:

- komponentového modelu,
- datového modelu,
- API kontraktů,
- JSON schémat,
- pricing/SLA enginů,
- ArchiMate modelu,
- validačních pravidel.
## Contracted boundaries in current phase

V aktuální fázi musí být jako canonical boundary explicitně uzavřeny:

- pricing contract boundary,
- SLA contract boundary,
- lifecycle boundary,
- publication boundary,
- ownership boundary,
- validation boundary,
- import/export boundary.

Tyto boundary jsou součástí scope hardeningu SPEC.
Neznamenají implementaci API ani deployment design.

## Explicit not-yet-modeled areas

V aktuální fázi nejsou normativně modelovány:

- runtime orchestrace,
- provisioning execution,
- subscription lifecycle runtime instancí,
- incident workflow,
- billing logika,
- vendor-specific transportní mechanismy.

Tyto oblasti nesmí být domýšleny jako součást canonical business scope tohoto SPEC.

## Import/export scope constraints

Import/export je v aktuálním scope povolen pouze jako contract-governed artifact boundary.

To znamená:
- musí být verzovaný,
- musí mít validační pravidla,
- musí respektovat lifecycle a publication governance,
- nesmí obcházet ownership nebo approval model,
- nesmí být zaměněn za implementační API design.



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



















# Komponenty

```yaml
metadata:
  model_id: catalog-services-components
  version: 1.0.0
  interpretation: deployment-neutral logical capability model
  owner_role: Technical Owner
  approval_role: Approval Owner
  contract_dependencies:
    - ownership-contract
    - validation-contract

components:
  - id: element_template_editor
    name: Element Template Editor
    type: application_component
    layer: application
    interpretation: logical capability
    primary_owner_role: Technical Owner
    supporting_roles:
      - Data Steward
    purpose: Správa šablon elementárních položek podle typů.
    responsibilities:
      - definice typů elementárních položek
      - definice povinných a volitelných atributů
      - definice validačních pravidel šablon
      - správa verzí šablon
    interfaces:
      - web_ui
      - api
      - json_import_export
    contract_dependencies:
      - ownership-contract
      - lifecycle-contract
      - import-export-contract

  - id: elementary_items_catalog
    name: Elementary Items Catalog
    type: application_component
    layer: application
    interpretation: logical capability
    primary_owner_role: Technical Owner
    supporting_roles:
      - Data Steward
      - Integration Owner
    purpose: Evidence konkrétních elementárních položek vytvořených podle šablon.
    responsibilities:
      - evidence elementárních položek
      - validace položek proti šablonám
      - správa provozních atributů
      - správa nákladových atributů
      - správa povinných provozních činností
      - import a export položek do JSON
    interfaces:
      - web_ui
      - api
      - json_import_export
    contract_dependencies:
      - ownership-contract
      - lifecycle-contract
      - import-export-contract
      - validation-contract

  - id: aggregation_builder
    name: Aggregation Builder
    type: application_component
    layer: application
    interpretation: logical capability
    primary_owner_role: Technical Owner
    supporting_roles:
      - Data Steward
    purpose: Skládání elementárních položek do agregačních služeb a prostředí.
    responsibilities:
      - výběr elementárních položek
      - skládání položek do agregací
      - definice množství položek
      - definice rolí v topologii
      - definice redundancy groups
      - validace kompozice
    interfaces:
      - web_ui
      - api
      - json_import_export
    contract_dependencies:
      - ownership-contract
      - lifecycle-contract
      - validation-contract

  - id: aggregated_services_catalog
    name: Aggregated Services Catalog
    type: application_component
    layer: application
    interpretation: logical capability
    primary_owner_role: Technical Owner
    supporting_roles:
      - Data Steward
    purpose: Evidence agregačních služeb složených z elementárních položek.
    responsibilities:
      - evidence agregačních služeb
      - evidence složení agregace
      - evidence dependency graphu
      - evidence topology modelu
      - evidence povinných provozních činností
      - import a export agregačních služeb do JSON
    interfaces:
      - web_ui
      - api
      - json_import_export
    contract_dependencies:
      - ownership-contract
      - lifecycle-contract
      - import-export-contract
      - sla-contract

  - id: customer_services_catalog
    name: Customer Services Catalog
    type: application_component
    layer: business
    interpretation: logical capability
    primary_owner_role: Business Owner
    supporting_roles:
      - Technical Owner
      - Data Steward
    purpose: Evidence zákaznických služeb postavených nad agregačními službami.
    responsibilities:
      - evidence zákaznických služeb
      - vazba zákaznických služeb na agregační služby
      - evidence business atributů
      - evidence business overhead
      - evidence volitelných business operací
    interfaces:
      - web_ui
      - api
      - json_import_export
    contract_dependencies:
      - ownership-contract
      - lifecycle-contract
      - pricing-contract
      - publication-contract

  - id: mandatory_service_activities
    name: Mandatory Service Activities
    type: application_component
    layer: application
    interpretation: logical capability
    primary_owner_role: Technical Owner
    supporting_roles:
      - Data Steward
    purpose: Evidence povinných provozních činností, které jsou nedílnou součástí elementárních i agregačních položek.
    responsibilities:
      - evidence povinných činností pro elementární položky
      - evidence povinných činností pro agregační služby
      - definice činností, které zákazník nemůže odmítnout
      - zahrnutí povinných činností do pricing výpočtu
      - zahrnutí povinných činností do SLA a provozního modelu
    interfaces:
      - web_ui
      - api
      - json_import_export
    contract_dependencies:
      - lifecycle-contract
      - pricing-contract
      - sla-contract

  - id: pricing_calculator
    name: Pricing Calculator
    type: application_component
    layer: application
    interpretation: logical capability
    primary_owner_role: Contract Owner
    supporting_roles:
      - Business Owner
      - Data Steward
    purpose: Výpočet ceny z elementárních položek, agregační kompozice, povinných činností a business overhead.
    responsibilities:
      - výpočet raw cost elementárních položek
      - výpočet ceny povinných provozních činností
      - výpočet ceny agregační služby
      - výpočet business overhead
      - výpočet ceny zákaznické služby
      - vytvoření pricing trace
    interfaces:
      - api
      - web_ui
    contract_dependencies:
      - pricing-contract
      - validation-contract
      - publication-contract

  - id: sla_calculator
    name: SLA Calculator
    type: application_component
    layer: application
    interpretation: logical capability
    primary_owner_role: Contract Owner
    supporting_roles:
      - Technical Owner
      - Data Steward
    purpose: Výpočet dostupnosti a SLA z topologie agregační služby.
    responsibilities:
      - výpočet dostupnosti agregační služby
      - vyhodnocení redundancy modelu
      - vyhodnocení dopadu povinných a volitelných prvků
      - zohlednění povinných provozních činností
      - vytvoření SLA trace
    interfaces:
      - api
      - web_ui
    contract_dependencies:
      - sla-contract
      - validation-contract
      - publication-contract

  - id: json_import_export_service
    name: JSON Import / Export Service
    type: application_component
    layer: application
    interpretation: logical capability
    primary_owner_role: Integration Owner
    supporting_roles:
      - Contract Owner
      - Data Steward
    purpose: Import a export šablon, elementárních položek, agregací, povinných činností a zákaznických služeb ve formátu JSON.
    responsibilities:
      - export šablon do JSON
      - import šablon z JSON
      - export elementárních položek do JSON
      - import elementárních položek z JSON
      - export agregačních služeb do JSON
      - import agregačních služeb z JSON
      - export povinných provozních činností do JSON
      - import povinných provozních činností z JSON
      - validace JSON struktury
    interfaces:
      - api
      - file_import
      - file_export
    contract_dependencies:
      - import-export-contract
      - validation-contract
      - publication-contract

  - id: catalog_database
    name: Catalog Database
    type: data_object
    layer: application
    interpretation: logical persistence domain
    primary_owner_role: Data Steward
    supporting_roles:
      - Technical Owner
    purpose: Datové úložiště šablon, elementárních položek, agregací, zákaznických služeb, povinných činností a výpočtů.
    responsibilities:
      - ukládání šablon elementárních položek
      - ukládání elementárních položek
      - ukládání agregačních služeb
      - ukládání zákaznických služeb
      - ukládání povinných provozních činností
      - ukládání pricing a SLA výpočtů
      - ukládání validation a publication evidence
    interfaces:
      - sql
    contract_dependencies:
      - pricing-contract
      - sla-contract
      - lifecycle-contract
      - publication-contract
      - validation-contract

  - id: web_application
    name: Web Application
    type: application_component
    layer: application
    interpretation: logical capability
    primary_owner_role: Approval Owner
    supporting_roles:
      - Business Owner
      - Technical Owner
    purpose: Uživatelské rozhraní pro správu šablon, elementárních položek, agregací, povinných činností a výpočtů.
    responsibilities:
      - správa šablon
      - správa elementárních položek
      - skládání agregačních služeb
      - správa zákaznických služeb
      - správa povinných provozních činností
      - spuštění pricing výpočtu
      - spuštění SLA výpočtu
      - import a export JSON
      - review publication a validation statusu
    interfaces:
      - web_ui
    contract_dependencies:
      - publication-contract
      - validation-contract
      - ownership-contract

relations:
  - source: web_application
    target: element_template_editor
    type: serving
    description: Webová aplikace poskytuje UI pro správu šablon elementárních položek.

  - source: web_application
    target: elementary_items_catalog
    type: serving
    description: Webová aplikace poskytuje UI pro správu elementárních položek.

  - source: web_application
    target: aggregation_builder
    type: serving
    description: Webová aplikace poskytuje UI pro skládání agregačních služeb.

  - source: web_application
    target: aggregated_services_catalog
    type: serving
    description: Webová aplikace poskytuje UI pro správu agregačních služeb.

  - source: web_application
    target: customer_services_catalog
    type: serving
    description: Webová aplikace poskytuje UI pro správu zákaznických služeb.

  - source: web_application
    target: mandatory_service_activities
    type: serving
    description: Webová aplikace poskytuje UI pro správu povinných provozních činností.

  - source: element_template_editor
    target: elementary_items_catalog
    type: serving
    description: Šablony určují strukturu a validaci elementárních položek.

  - source: elementary_items_catalog
    target: aggregation_builder
    type: serving
    description: Elementární položky jsou stavebními bloky pro agregace.

  - source: aggregation_builder
    target: aggregated_services_catalog
    type: flow
    description: Výsledkem skládání je agregační služba uložená v katalogu.

  - source: aggregated_services_catalog
    target: customer_services_catalog
    type: serving
    description: Zákaznické služby jsou stavěny nad agregačními službami.

  - source: mandatory_service_activities
    target: elementary_items_catalog
    type: access
    description: Povinné činnosti jsou přiřazeny k elementárním položkám jako součást jejich provozního profilu.

  - source: mandatory_service_activities
    target: aggregated_services_catalog
    type: access
    description: Povinné činnosti jsou přiřazeny k agregačním službám jako součást jejich provozního modelu.

  - source: pricing_calculator
    target: elementary_items_catalog
    type: access
    description: Pricing Calculator čte nákladové atributy elementárních položek.

  - source: pricing_calculator
    target: aggregated_services_catalog
    type: access
    description: Pricing Calculator čte složení agregačních služeb.

  - source: pricing_calculator
    target: customer_services_catalog
    type: access
    description: Pricing Calculator čte business overhead zákaznických služeb.

  - source: pricing_calculator
    target: mandatory_service_activities
    type: access
    description: Pricing Calculator zahrnuje náklady povinných činností do výsledné ceny.

  - source: sla_calculator
    target: aggregated_services_catalog
    type: access
    description: SLA Calculator čte topologii a redundanci agregačních služeb.

  - source: sla_calculator
    target: mandatory_service_activities
    type: access
    description: SLA Calculator zohledňuje povinné činnosti při vyhodnocení provozního modelu služby.

  - source: json_import_export_service
    target: element_template_editor
    type: access
    description: JSON služba importuje a exportuje šablony elementárních položek.

  - source: json_import_export_service
    target: elementary_items_catalog
    type: access
    description: JSON služba importuje a exportuje elementární položky.

  - source: json_import_export_service
    target: aggregated_services_catalog
    type: access
    description: JSON služba importuje a exportuje agregační služby.

  - source: json_import_export_service
    target: customer_services_catalog
    type: access
    description: JSON služba importuje a exportuje zákaznické služby.

  - source: json_import_export_service
    target: mandatory_service_activities
    type: access
    description: JSON služba importuje a exportuje definice povinných provozních činností.

  - source: element_template_editor
    target: catalog_database
    type: access
    description: Editor šablon ukládá definice šablon do databáze.

  - source: elementary_items_catalog
    target: catalog_database
    type: access
    description: Katalog elementárních položek ukládá položky do databáze.

  - source: aggregated_services_catalog
    target: catalog_database
    type: access
    description: Katalog agregačních služeb ukládá agregace do databáze.

  - source: customer_services_catalog
    target: catalog_database
    type: access
    description: Katalog zákaznických služeb ukládá zákaznické služby do databáze.

  - source: mandatory_service_activities
    target: catalog_database
    type: access
    description: Povinné provozní činnosti jsou ukládány do katalogové databáze.

  - source: pricing_calculator
    target: catalog_database
    type: access
    description: Pricing Calculator ukládá pricing trace a výsledky výpočtů.

  - source: sla_calculator
    target: catalog_database
    type: access
    description: SLA Calculator ukládá SLA trace a výsledky výpočtů.

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
Systém je regenerovatelný ze specifikace pouze tehdy, pokud jsou stabilní canonical boundary a aktivní validační governance.

## Vstupy pro regeneraci
- specifikace
- canonical contracts
- validation layer
- governance context
- data

## Stable zones
Stable zones jsou oblasti, které musí být explicitně stabilní před řízenou regenerací.

Patří sem:
- ES → AG → CS doménové hranice
- pricing contract
- SLA contract
- lifecycle contract
- publication contract
- ownership contract
- validation contract
- active validation rule set
- approval governance

Stable zones nesmí být měněny agenticky bez explicitního lidského schválení.

## Regenerable zones
Regenerable zones jsou oblasti, které lze po splnění preconditions bezpečně regenerovat.

Patří sem zejména:
- backend scaffolding odvozený z canonical contracts
- frontend admin moduly odvozené ze schválených katalogových boundary
- persistence adapters odvozené z logických persistence domén
- validation utilities
- reporting a traceability read-model vrstvy

Regenerable zones musí vždy respektovat stable zones a contract-first zones.

## Contract-first zones
Contract-first zones jsou oblasti, kde implementace nebo regenerace nesmí předběhnout normativní contract.

Patří sem:
- pricing
- SLA
- import/export
- publication
- validation
- ownership
- change propagation semantics

Pokud contract-first zone nemá schválený canonical contract, regenerace se nesmí spustit.

## Human approval gates
Lidské schválení je povinné pro:
- změnu stable zone
- změnu contract-first zone
- contract-breaking change
- publication aggregated SPEC view
- první regeneration test nové contract family
- změnu validation enforcement level u blocking pravidel

## Neregenerovatelné části
Neregenerovatelné části v rámci tohoto SPEC:
- produkční data
- externí integrace jako konkrétní implementace
- runtime incident handling
- vendor-specific deployment topologie

## Preconditions for regeneration runs
Před každým regeneration runem musí být splněno:
- aggregated SPEC je synchronizovaný se source SPEC
- validation report je aktuální
- neexistuje blocking validation finding
- pricing a SLA contracts jsou active
- lifecycle a publication governance jsou active
- stable zones a regenerable zones jsou explicitně označené

## Validation dependency
Regenerace závisí na:
- active validation contract
- active consistency rules
- evidence, že target artifacts nejsou v rozporu s canonical contracts

## Triggery regenerace
- změna specifikace mimo stable zones
- schválená structural nebo semantic změna s dopadem do regenerable zones
- pokles metrik kvality implementace
- refactoring v regenerable zones

## Stop conditions
Regeneration run musí být zastaven, pokud:
- je porušena stable zone
- chybí contract-first artifact
- validation vrátí blocking issue
- aggregated SPEC není synchronizovaný
- chybí required human approval gate











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


# Validation Report

## Report metadata
- validated_project: catalog-services
- validated_spec_version: 0.1
- rule_set_version: 1.0.0
- validation_scope: post-hardening
- validation_mode: automated + agent review + manual semantic review required

## Executive summary
Hardening layer už není placeholder.
Canonical contracts, governance a regeneration rules byly doplněny.
Validation layer je nyní aktivní a obsahuje blocking pravidla pro critical boundary.

## Passed rules
- STR-001 Required hardening artifact families exist
- CON-001 Pricing contract is active and normative
- CON-002 SLA contract is active and normative
- REG-001 Regeneration zones are explicitly distinguished

## Warnings
- CMP-001 vyžaduje průběžné manuální hlídání, aby implementační týmy nečetly komponenty jako deployable units.
- ArchiMate traceability artifacts zůstávají mimo tento hardening wave.

## Blocking failures
- None at hardening-structure level.

## Manual review findings
- ES → AG → CS layering zůstává zachováno.
- Business scope systému nebyl rozšířen.
- Contracts jsou deployment-neutral a neobsahují fake API design.

## Agent review findings
- Aggregated SPEC vyžaduje synchronizaci po každé změně source SPEC.
- Contracts obsahují required inputs, outputs, normative rules a persistence implications.
- Governance now specifies owner and approval semantics.

## Canonical synchronization status
- status: synchronized by hardening wave
- condition: must be revalidated after every source change

## Regeneration readiness status
- status: conditionally ready
- conditions:
  - active contracts retained
  - validation report kept current
  - human approval gates respected

## Recommendations
- Před první plnou regeneration zkouškou znovu spustit validation against current source set.
- Optional ArchiMate hardening provést v samostatné vlně, ne v této změně.


