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
