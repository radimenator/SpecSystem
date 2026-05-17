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