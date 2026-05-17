# Governance

## Účel

Tento dokument definuje technology-neutral governance model pro SPEC projektu `catalog-services`.

Governance vrstva řídí:
- ownership,
- approval model,
- publication pravidla,
- change governance,
- versioning governance,
- validační odpovědnosti.

Governance nemění business scope systému.
Governance pouze určuje, kdo a za jakých podmínek může měnit canonical SPEC artefakty.

---

## Governance principy

- Canonical source of truth je pouze publikovaný SPEC.
- Draft artefakty nesmí být použity jako vstup pro řízenou regeneraci bez explicitního lidského schválení.
- Kontrakty jsou deployment-neutral a definují významové boundary, nikoliv konkrétní implementační rozhraní.
- Každý publishable artefakt musí mít ownera, lifecycle stav, verzi a validační výsledek.
- Contract-breaking změny musí procházet zesíleným approval režimem.
- Změna lower-layer artefaktu musí být posouzena na dopad do vyšších vrstev ES → AG → CS.

---

## Ownership model

### Role typy

#### Business Owner
Odpovídá za:
- business význam zákaznických služeb,
- business overhead a business-facing interpretaci,
- schválení business dopadů změny.

#### Technical Owner
Odpovídá za:
- technickou správnost ES a AG modelu,
- topology a dependency logiku,
- technické dopady změn.

#### Data Steward
Odpovídá za:
- kvalitu katalogových dat,
- konzistenci metadat,
- správnost verzí, stavů a referencí.

#### Contract Owner
Odpovídá za:
- canonical contracts,
- semantic stabilitu contract boundary,
- změnovou kompatibilitu contract family.

#### Approval Owner
Odpovídá za:
- lifecycle a publication gates,
- potvrzení, že změna splnila požadované validace,
- rozhodnutí publish / hold / reject.

#### Integration Owner
Odpovídá za:
- boundary vůči CMDB,
- boundary vůči monitoringu,
- boundary vůči exportům a importům,
- reconciliation pravidla.

---

## Ownership assignments by domain

### ES katalog
- Primary role: Technical Owner
- Supporting roles: Data Steward, Approval Owner

### AG katalog
- Primary role: Technical Owner
- Supporting roles: Data Steward, Approval Owner

### CS katalog
- Primary role: Business Owner
- Supporting roles: Technical Owner, Data Steward, Approval Owner

### Pricing contracts a pricing pravidla
- Primary role: Contract Owner
- Supporting roles: Business Owner, Data Steward, Approval Owner

### SLA contracts a SLA pravidla
- Primary role: Contract Owner
- Supporting roles: Technical Owner, Data Steward, Approval Owner

### Validation layer
- Primary role: Contract Owner
- Supporting roles: Data Steward, Approval Owner

### Regeneration rules
- Primary role: Approval Owner
- Supporting roles: Contract Owner, Data Steward

### Integration boundary
- Primary role: Integration Owner
- Supporting roles: Technical Owner, Contract Owner, Approval Owner

---

## Approval model

### Approval classes

#### Low-risk change
Typicky:
- editorial change,
- upřesnění bez změny významu,
- doplnění chybějící reference bez změny semantics.

Vyžaduje:
- Data Steward review,
- standard validation.

#### Semantic change
Typicky:
- změna významu katalogového atributu,
- změna pricing nebo SLA semantics,
- změna governance expectation.

Vyžaduje:
- domain owner review,
- Contract Owner review pokud se dotýká contract boundary,
- Approval Owner publication gate.

#### Contract-breaking change
Typicky:
- změna required fieldů contractu,
- změna compatibility expectation,
- změna publication nebo lifecycle semantics.

Vyžaduje:
- Contract Owner approval,
- Approval Owner approval,
- explicitní evidence dopadu,
- aktualizovaný validation report.

#### Regeneration-risk change
Typicky:
- změna stable zones,
- změna contract-first zones,
- změna pravidel pro agentické zásahy.

Vyžaduje:
- Approval Owner approval,
- Contract Owner review,
- aktualizovaný regeneration readiness check.

---

## Publication governance

Publishable artefakt musí mít vždy:
- jednoznačný identifier,
- verzi,
- lifecycle stav způsobilý k publikaci,
- určeného ownera,
- validační výsledek bez blocking issues,
- splněný approval režim dle change class.

### Publishable artifact families
- source SPEC kapitoly,
- canonical contracts,
- validation rules,
- validation report,
- aggregated SPEC view,
- regeneration readiness artifacts.

### Draft-only artifacts
Za draft-only se považují artefakty, které:
- nemají approval,
- nemají final validation,
- mají lifecycle nižší než `approved`,
- jsou explicitně označené jako pracovní návrh.

Draft-only artefakt nesmí být použit jako canonical input pro řízenou regeneraci.

---

## Versioning governance

Governance rozlišuje:
- SPEC version,
- contract version,
- validation rule-set version,
- publication version aggregated view.

### Versioning expectations
- Každá semantic change musí mít verzový dopad.
- Každá contract-breaking change musí mít explicitní version bump contract family.
- Validation report musí odkazovat na konkrétní rule-set version i SPEC version.
- Aggregated SPEC musí být odvoditelný ze schválených source artefaktů stejné publikační generace.

---

## Validation responsibilities

### Automatické validace
Odpovídá za ně:
- Data Steward,
- nástroje validation workflow.

### Agentické validace
Odpovídá za ně:
- Contract Owner,
- Approval Owner jako reviewer výsledku.

### Manuální validace
Odpovídá za ně:
- Business Owner,
- Technical Owner,
- Approval Owner podle typu změny.

---

## Escalation

Pokud se role neshodnou:
- semantic konflikt business vs technical řeší Approval Owner,
- contract konflikt řeší Contract Owner + Approval Owner,
- regeneration-risk konflikt má prioritu Approval Owner.

---

## Governance output expectation

Governance je splněná pouze tehdy, pokud:
- canonical contracts existují,
- ownership je explicitní,
- validation layer je aktivní,
- publication rules jsou doložitelné,
- regeneration rules rozlišují stable zones, regenerable zones, contract-first zones a human approval gates.
