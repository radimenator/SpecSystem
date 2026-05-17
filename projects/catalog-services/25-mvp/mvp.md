# MVP catalog-services

## Účel MVP

MVP ověřuje, že lze vytvořit jednoduchou webovou aplikaci pro správu katalogových listů služeb a jejich skládání podle modelu:

ES → AG → CS

Cílem MVP není plná enterprise governance, ale praktická formulářová aplikace nad základním katalogovým modelem.

---

## V1 Scope

### Elementární služby (ES)
- založení, editace, smazání a vyhledávání ES katalogových listů
- typy ES:
  - Lokalita
  - Rack
  - WAN linka
  - Server
  - Router
  - Switch
  - Load Balancer
  - Firewall
  - Virtualizace
  - Kontejnerizace

### Agregační služby (AG)
- založení, editace, smazání a vyhledávání AG katalogových listů
- skládání AG z ES
- u položek AG evidovat:
  - přiřazenou ES službu
  - počet
  - roli v topologii
  - zda je položka povinná
- jednoduchý výpočet provozní ceny AG jako součet cen ES položek × počet

### Zákaznické služby (CS)
- založení, editace, smazání a vyhledávání CS katalogových listů
- skládání CS z AG
- evidence volitelných položek / options
- jednoduchý výpočet ceny CS:
  - součet cen AG
  - plus business overhead
  - plus volitelné options

### Import / Export
- export katalogu do JSON
- import katalogu z JSON
- bez pokročilé compatibility policy v MVP

---

## V1 Out of Scope

- reálná CMDB integrace
- reálný monitoring
- reálný SLA engine
- provisioning workflow
- approval workflow
- ArchiMate synchronizace
- fakturace
- multi-user role model
- produkční audit trail

---

## Hlavní obrazovky

### ES Catalog
- přehled ES
- vyhledávání a filtrování podle typu
- detail ES
- formulář pro založení/editaci ES

### AG Catalog
- přehled AG
- detail AG
- formulář AG
- výběr ES položek do kompozice
- zobrazení vypočtené ceny AG

### CS Catalog
- přehled CS
- detail CS
- formulář CS
- výběr AG položek do zákaznické služby
- správa options
- zobrazení vypočtené ceny CS

### Import / Export
- tlačítko export JSON
- upload/import JSON
- zobrazení výsledku importu

---

## Akce uživatele

- založit ES / AG / CS
- upravit ES / AG / CS
- smazat ES / AG / CS
- vyhledat ES / AG / CS
- přiřadit ES do AG
- přiřadit AG do CS
- spočítat cenu AG
- spočítat cenu CS
- exportovat katalog do JSON
- importovat katalog z JSON

---

## Automatické výpočty v MVP

### Cena AG
Cena AG se počítá jako:

```text
AG cena = suma(ES měsíční cena × počet)
```

Cena CS

Cena CS se počítá jako:
```text
CS cena = suma(AG cena × počet) + business overhead + suma(options)
```

Co se v MVP zatím nepočítá

* SLA
* dostupnost
* dopad výpadků
* topology-aware pricing
* redundancy-aware pricing
* approval impact
* full audit trace

