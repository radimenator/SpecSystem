# SpecSystem

SpecSystem je **primární uložiště specifikací projektů**.

Primárním cílem je oddělit **specifikaci (intent, architektura, kontext)** od **implementace (kód)** a umožnit:

- porozumění systému jako celku
- verzování a evoluci specifikací
- regeneraci kódu ze specifikace
- práci s AI agenty na základě strukturovaného vstupu

---

## 🧠 Základní princip

> **Specifikace je zdroj pravdy.  
Kód je odvozený artefakt.**

---

## 🧩 Oddělení odpovědností

- `~/Projects` → implementace, kód, skripty
- `~/SpecSystem` → specifikace (kanonická pravda)
- `Roam Research` → kontext, poznámky, úvahy, tasky

---

## 📐 Základní pravidla

- každá aplikace má **jednu root specifikaci**
- root specifikace je v: `~/SpecSystem/projects/`

specifikace je:
- verzovaná (Git)
- strukturovaná (YAML + Markdown)
- čitelná pro člověka i stroj
- pracovní poznámky ≠ specifikace
- významné změny:
- se zapisují do `80-history`
- a do Git logu

---

## 🏗️ Minimální struktura projektu

Každá specifikace obsahuje:
00-meta            → metadata projektu
10-motivation      → proč systém existuje
20-scope           → co systém řeší
30-architecture    → jak je navržen
40-components      → z čeho se skládá
50-decisions       → klíčová rozhodnutí (ADR)
60-links           → vazby na implementaci
70-regeneration    → jak systém regenerovat
80-history         → historie změn

---

## 🔄 Workflow

### 1. Myšlení (Roam)
- nápady
- problémy
- návrhy

### 2. Formalizace (SpecSystem)
- přepis do specifikace
- strukturované artefakty

### 3. Implementace (Projects)
- generování / úprava kódu
- práce s AI agenty

### 4. View dokument
```bash
~/SpecSystem/build-spec-doc.sh <project-id> html
```
Výstup: dist/spec.html

---

## 📄 View dokument

Specifikace se generuje do čitelného formátu:
-	HTML → hlavní pracovní view
-	PDF → export (ideálně přes Safari)
-	DOCX → sdílení

---

## 🧠 Architektura systému

SpecSystem má vrstvenou architekturu, která odděluje:

- zdroj pravdy (specifikace)
- prezentaci (view dokumenty)
- nástroje (scripts)
- externí systémy

### Přehled vrstev

| Vrstva | Komponenta | Popis | Technologie / nástroje |
|--------|------------|-------|------------------------|
| **Motivation / Intent** | Specifikace (YAML + MD) | Kanonický zdroj pravdy o systému | YAML, Markdown |
| **Application (Processing)** | Build skripty | Generování view dokumentů ze specifikace | Bash, Pandoc |
| **Application (Templates)** | Templates | Definice struktury specifikací | YAML, Markdown |
| **Application (Instantiation)** | create-spec-project.sh | Vytváření nových specifikací z template | Bash, Python |
| **Presentation (View)** | HTML / DOCX / PDF | Čitelné výstupy specifikace | Pandoc, CSS, HTML |
| **Storage** | Git repository | Verzování specifikací | Git, GitHub |
| **External Context** | Roam Research | Kontext, poznámky, řízení práce | Roam |
| **Implementation** | ~/Projects | Zdrojový kód aplikací | různé (Python, JS, …) |
| **Future (Visualization)** | ArchiMate model | Grafická reprezentace architektury | Sparx EA |

---

### Tok informací

```text
Roam (myšlení)
      ↓
SpecSystem (specifikace = source of truth)
      ↓
Build skripty
      ↓
View dokument (HTML)
      ↓
AI agenti / člověk
      ↓
Implementace (~/Projects)
      ↓
Feedback
      ↓
Specifikace
```

### Role jednotlivých vrstev
	•	Specifikace (YAML/MD) → definují co systém je
	•	Templates → definují jak má specifikace vypadat
	•	Skripty → definují jak se specifikace transformuje
	•	View dokumenty → umožňují porozumění
	•	Git → zajišťuje historii a verze
	•	Roam → slouží pro myšlení a kontext
	•	Projects → obsahují realizaci

### Budoucí rozšíření
	•	ArchiMate jako vizualizační vrstva
	•	generování diagramů ze specifikace
	•	AI-driven validace a návrh změn

---

## 🧪 Templates

Templates definují šablony specifikace ve složce: ~/SpecSystem/templates/project-spec/
Používají se pro:
- zakládání projektů
- sjednocení struktury
- práci s AI

---

## ⚙️ Vytvoření projektu

Použij:
`~/SpecSystem/create-spec-project.sh <project-id> "Human Name"`
Např.:
`~/SpecSystem/create-spec-project.sh tech-radar "Tech Radar"`

📦 Generování dokumentace
`~/SpecSystem/build-spec-doc.sh <project-id> html`

Doporučené:
- HTML = hlavní view
- PDF = export přes Safari (Cmd + P)

## 🚀 Další kroky

v5 - ArchiMate bridge
-	mapování components.yaml → ArchiMate
- generování architektonických diagramů
- ArchiMate jako view nad specifikací

⸻

v6 - AI integration
- AI agenti pracují přímo nad specifikací
- generování:
- kódu
- testů
- návrhů změn
- SpecSystem jako vstup pro agentní systémy (OpenClaw, Hermes)

⸻

v7 - Validace specifikace
- kontrola struktury specifikace
- detekce chyb:
- chybějící sekce
- nevyplněná metadata
- nekonzistence
- automatické linting pravidla

⸻

v8 - Multi-project view
- pohled přes více projektů
- závislosti mezi systémy
- vyšší architektonická vrstva (system-of-systems)
