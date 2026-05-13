```markdown
## ADR-001: Specifikace jsou uloženy mimo ~/Projects

**Stav:** Přijato

**Důvod:**
Kód je nahraditelný artefakt. Specifikace je primární znalostní zdroj.

**Tradeoffs:**
- Oddělení specifikací od kódu umožňuje lepší správu a aktualizaci.
- Zvyšuje kontrolu nad specifikacemi jako samostatným artefaktem.

## ADR-002: Jedna aplikace má jeden root specifikace

**Stav:** Přijato

**Důvod:**
Je potřeba mít jednoznačný vstupní bod pro porozumění systému.

**Tradeoffs:**
- Zjednodušení navigace a porozumění struktuře projektu.
- Snížení možnosti konfliktů mezi různými zdroji specifikací.

## ADR-003: Roam není kanonické uložiště specifikací

**Stav:** Přijato

**Důvod:**
Roam je vhodný pro myšlení a vazby, ale ne jako kanonický, verzovaný a strojově čitelný zdroj pravdy.

**Tradeoffs:**
- Použití Roamu pro kontext projektu umožňuje flexibilní práci s ideemi.
- SpecSystem poskytuje stabilní a formální specifikace.

## ADR-004: Specifikace musí jít publikovat do čitelného dokumentu

**Stav:** Přijato

**Důvod:**
Kanonický zdroj není totéž co čitelný dokument pro práci a revizi.

**Tradeoffs:**
- Zavedení publikační vrstvy umožňuje vytváření formálních dokumentů.
- Omezování změn specifikace při generování dokumentu zajišťuje konzistenci.

## ADR-005: Zdrojové dokumenty jsou evidence, nikoliv kanonická pravda

**Stav:** Přijato

**Důvod:**
Vstupní dokumenty mohou být neaktuální, neúplné nebo nekonzistentní.
Je nutné oddělit realitu vstupů od interpretace a schválené specifikace.

**Tradeoffs:**
- Oddělení zdrojových dokumentů od specifikací umožňuje lepší kontrolu nad změnami.
- Zajišťuje, že specifikace je vždy aktuální a konsistentní.

## ADR-006: Obsidian / LLM Wiki je interpretační vrstva, ne zdroj pravdy

**Stav:** Přijato

**Důvod:**
Je potřeba mít prostor pro syntézu, pojmy a vazby bez narušení kanonické specifikace.

**Tradeoffs:**
- Wiki poskytuje flexibilní prostor pro práci s znalostmi.
- SpecSystem zůstává jediným oficiálním zdrojem pravdy.

## ADR-007: ArchiMate model je formální projekce specifikace

**Stav:** Přijato

**Důvod:**
Architektonický model musí být strukturovaný, validovatelný a nástrojově přenositelný.

**Tradeoffs:**
- Formální model umožňuje validaci a automatické generování dokumentů.
- Zajišťuje, že specifikace je vždy konsistentní s architekturou.

## ADR-008: Výstupní dokumenty jsou odvozené artefakty

**Stav:** Přijato

**Důvod:**
Dokumenty slouží ke komunikaci, ne jako zdroj pravdy.

**Tradeoffs:**
- Generování dokumentů ze specifikace a modelu zajišťuje konzistenci.
- Omezující faktor pro změny v dokumentech je potřeba schválení změn ve specifikaci nebo modelu.

## ADR-009: LLM je asistent, ne autorita

**Stav:** Přijato

**Důvod:**
LLM může generovat chyby, halucinace a nekonzistentní výstupy.

**Tradeoffs:**
- Použití LLM pro návrhy a extrakci dat zajišťuje efektivitu práce.
- Omezující faktor pro změny je potřeba schválení změn od lidí nebo validace modelu.

## ADR-010: Traceability je povinná napříč vrstvami

**Stav:** Přijato

**Důvod:**
Bez dohledatelnosti není možné ověřit správnost specifikace ani modelu.

**Tradeoffs:**
- Zajišťuje, že každý prvek může být validován a zkontrolován.
- Omezující faktor pro rychlé změny je nutnost evidencí všech změn.

## ADR-011: Local-first architektura s doplňkovým VPS

**Stav:** Přijato

**Důvod:**
Uživatel potřebuje plnou kontrolu nad daty, možnost práce offline a bezpečnost citlivých informací.
Zároveň je potřeba sdílení, automatizace a běh agentů.

**Tradeoffs:**
- Lokální architektura zajišťuje kontrolu nad daty a nízkou latenci.
- VPS umožňuje sdílení a automatizaci úloh.

## ADR-012: Obsidian Wiki je společná napříč projekty

**Stav:** Přijato

**Důvod:**
Wiki má sloužit jako znalostní báze napříč projekty, nikoliv jako izolovaná projektová dokumentace.

**Tradeoffs:**
- Společný wiki umožňuje sdílení znalostí mezi různými projekty.
- Izolace projektových znalostí v `shared/wiki/projects/<project-id>/` zajišťuje strukturu a organizaci.
```
