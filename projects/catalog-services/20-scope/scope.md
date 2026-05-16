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