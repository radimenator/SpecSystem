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

## ADR-007 Aplikace jsou modelovány jako elementární služby

### Stav
Schváleno

### Kontext

Během návrhu katalogového modelu vznikla otázka,
zda mají být aplikace modelovány jako:

- agregační služby (`AG`),
nebo
- elementární služby (`ES`).

Původní návrh uvažoval:
- `ag_application`,
- tedy aplikaci jako agregační službu složenou z:
  - lokalit,
  - racků,
  - serverů,
  - virtualizace,
  - síťových služeb.

To však vedlo k několika problémům:

- riziko dvojího účtování infrastruktury,
- nejasný ownership platformy,
- nejasná inheritance pricing logiky,
- potřeba shared resource allocation,
- potřeba dependency graphu AG → AG,
- nejasná hranice mezi platformou a workloadem.

Současně architektura UPAAS ukazuje,
že aplikace:
- běží NAD sdílenou platformou,
- ale nejsou samy platformní kompozicí.

Aplikace reprezentují:
- workload,
- runtime tenant,
- business/runtime deployment,
nikoliv infrastrukturní blueprint.

### Rozhodnutí

Aplikace jsou modelovány jako elementární služby (`ES`).

Canonical entity:
- `es_application`

Aplikace:
- nejsou agregační služby,
- nejsou runtime composition layer,
- nejsou topology blueprint.

Aplikace reprezentují:
- aplikační workload,
- tenant workload,
- business/runtime deployment jednotku.

Agregační služby zůstávají:
- technickou kompoziční vrstvou,
- infrastrukturním blueprintem,
- runtime/topology vrstvou.

Aplikace mohou:
- deklarovat potřeby:
  - monitoring,
  - logging,
  - backup,
  - firewall,
  - NAT,
  - load balancing,
- ale tyto potřeby nejsou automaticky enforceované katalogem.

Jde pouze o:
- architektonickou deklaraci,
- guidance pro návrh řešení,
- podporu návrhu zákaznických služeb.

### Důsledky

Model zůstává:
- jednodušší,
- bez AG → AG dependency,
- bez double pricing,
- bez shared allocation modelu,
- bez inherited costing.

Vzniká jasné rozdělení:

#### ES
- infrastruktura,
- platform primitives,
- workloady/aplikace.

#### AG
- technická kompozice,
- runtime blueprint,
- topology layer.

#### CS
- zákaznické/business služby,
- obchodní katalog,
- finální pricing.

### Explicitně mimo scope MVP

Mimo scope MVP zůstává:

- AG → AG dependency graph,
- shared platform allocation,
- inherited pricing,
- inherited SLA,
- runtime orchestration,
- CMDB dependency graph,
- cloud orchestration model.