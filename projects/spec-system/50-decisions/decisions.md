# Rozhodnutí

## ADR-001: Specifikace jsou uloženy mimo ~/Projects
### Stav
Přijato

### Důvod
Kód je nahraditelný artefakt. Specifikace je primární znalostní zdroj.

### Dopad
Vzniká oddělený repozitář ~/SpecSystem.

---

## ADR-002: Jedna aplikace má jeden root specifikace
### Stav
Přijato

### Důvod
Je potřeba mít jednoznačný vstupní bod pro porozumění systému.

### Dopad
Každý projekt má jednu kořenovou složku ve SpecSystem.

---

## ADR-003: Roam není kanonické uložiště specifikací
### Stav
Přijato

### Důvod
Roam je vhodný pro myšlení a vazby, ale ne jako kanonický, verzovaný a strojově čitelný zdroj pravdy.

### Dopad
Roam drží projektový kontext. SpecSystem drží platnou specifikaci.

---

## ADR-004: Specifikace musí jít publikovat do čitelného dokumentu
### Stav
Přijato

### Důvod
Kanonický zdroj není totéž co čitelný dokument pro práci a revizi.

### Dopad
Ve specifikaci existuje publikační vrstva a build proces.