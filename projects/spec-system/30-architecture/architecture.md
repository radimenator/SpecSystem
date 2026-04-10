# Architektura systému

## Účel
Uložiště specifikací slouží jako kanonický zdroj pravdy pro specifikace projektů.

## Hlavní oddělení
- Roam Research: projektový kontext, pracovní poznámky, aktivity
- SpecSystem: kanonická specifikace
- ~/Projects: implementace a kód

## Hlavní architektonické principy
- jedna aplikace má jeden root specifikace
- root specifikace je kořenová složka projektu ve SpecSystem
- specifikace může mít více artefaktů, ale jeden kanonický vstupní bod
- specifikace musí být čitelná člověkem i strojem
- z artefaktů specifikace musí být možné generovat dokument

## Hlavní vztahy
- Roam projekt odkazuje na root specifikace
- root specifikace odkazuje na implementaci v ~/Projects
- architektura vysvětluje globální pohled na aplikaci
- komponenty popisují rozpad na regenerovatelné části