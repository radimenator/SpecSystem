# Regeneration Readiness Checklist

## Purpose

Checklist pro go / no-go rozhodnutí před:
- předáním SPEC dev-teamu,
- prvním regeneration testem,
- změnou stable zones nebo contract-first zones.

## Mandatory checks

- [ ] Aggregated SPEC je synchronizovaný se source SPEC.
- [ ] Validation layer má neprázdná pravidla a aktuální report.
- [ ] Pricing contract je active a review-complete.
- [ ] SLA contract je active a review-complete.
- [ ] Lifecycle a publication contract jsou active.
- [ ] Ownership assignments existují pro publishable artifact families.
- [ ] Stable zones jsou explicitně vyjmenované.
- [ ] Regenerable zones jsou explicitně vyjmenované.
- [ ] Contract-first zones jsou explicitně vyjmenované.
- [ ] Human approval gates jsou explicitně vyjmenované.
- [ ] Neexistuje blocking finding v validation reportu.

## Decision

### GO
Použít pouze pokud jsou všechny mandatory checks splněné.

### HOLD
Použít pokud chybí non-critical evidence, ale nehrozí contract ambiguity.

### NO-GO
Použít pokud chybí canonical sync, validation layer, pricing/SLA contracts nebo approval governance.
