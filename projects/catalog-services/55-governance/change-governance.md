# Change Governance

## Účel

Tento dokument definuje change governance pro SPEC projektu `catalog-services`.

Řeší:
- klasifikaci změn,
- required review depth,
- required validation depth,
- publication constraints,
- dopad změn napříč ES → AG → CS.

---

## Change classes

### 1. Editorial change
Bez změny významu.
Příklady:
- oprava překlepu,
- zlepšení formulace,
- doplnění nefunkční reference bez semantic změny.

Vyžaduje:
- základní validation,
- Data Steward review.

### 2. Structural non-breaking change
Mění strukturu SPEC, ale ne contractual meaning.
Příklady:
- přesun kapitoly,
- doplnění nového vysvětlujícího oddílu,
- doplnění indexu nebo traceability odkazu.

Vyžaduje:
- structural validation,
- Data Steward review,
- Approval Owner potvrzení, pokud je změněn publishable artifact.

### 3. Semantic change
Mění význam modelu bez rozbití contract family.
Příklady:
- zpřesnění ownership,
- zpřesnění lifecycle expectation,
- rozšíření pravidel impact analysis.

Vyžaduje:
- domain review,
- agent consistency review,
- updated validation report.

### 4. Contract-breaking change
Mění canonical boundary contractu.
Příklady:
- změna required inputů pricing contractu,
- změna required outputs SLA contractu,
- změna compatibility expectation import/export contractu.

Vyžaduje:
- Contract Owner approval,
- explicitní change impact evidence,
- updated validation report,
- Approval Owner gate.

### 5. Regeneration-risk change
Mění pravidla agentického zásahu nebo stabilitu zón.
Příklady:
- přesun artefaktu ze stable zone do regenerable zone,
- změna human approval gate,
- uvolnění contract-first boundary.

Vyžaduje:
- regeneration review,
- Approval Owner approval,
- readiness re-check.

---

## Change propagation rules

### ES change
Musí být posouzena na dopad do:
- AG composition,
- SLA input model,
- pricing inheritance,
- import/export compatibility.

### AG change
Musí být posouzena na dopad do:
- CS offerings,
- SLA evaluation,
- pricing topology multiplier semantics,
- simulation scenarios.

### CS change
Musí být posouzena na dopad do:
- business-facing pricing,
- publication readiness,
- order-readiness artifacts.

### Contract change
Musí být posouzena na dopad do:
- validation rules,
- regeneration rules,
- aggregated SPEC,
- downstream implementation planning.

---

## Required evidence by change type

- Editorial: evidence of structural validity
- Structural non-breaking: evidence of updated references and canonical sync
- Semantic: evidence of domain review and affected artifacts
- Contract-breaking: evidence of compatibility decision and approval chain
- Regeneration-risk: evidence of readiness impact and human approval gate outcome

---

## Publication constraints

Změna nesmí být publikována, pokud:
- má blocking validation finding,
- chybí owner,
- chybí odpovídající contract reference tam, kde je vyžadována,
- mění stable zones bez regeneration review,
- mění contract-first oblast bez Contract Owner approval.
