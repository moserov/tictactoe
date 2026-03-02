# tictactoe

A new Flutter project.

## Task:

## Kontext
Diese Aufgabe ist bewusst **offen** formuliert. Uns geht es nicht darum, dass du **alles fertig** machst, sondern darum **wie du arbeitest**: 
- Wie hast du priorisiert?
- Welche Entscheidungen gab es zu treffen und warum hast du dich für die gewählte Lösung entschieden? (Bspw. Architektur, Statemanagement, Projektstruktur, etc.)
- Wie schaffst du Struktur?
- Wie stellst du die Qualität sicher?

Es braucht keine glänzende UI, aber sie sollte klar und funktional sein. 

Du darfst Annahmen treffen, sollten Teile der Aufgabenstellung unklar sein oder fehlen - bitte dokumentiere sie kurz.
Generell darfst du KI/Tools nutzen. Wichtig ist, dass du nachvollziehbar bleibst und nicht blind übernimmst. 
Die komplette Aufgabe / das komplette Ergebnis / komplette Klassen sollten logischerweise nicht in die KI gegeben werden. 
Hier ist ansonsten das Potential SEHR hoch, dass wir später eine viel zu hohe Erwartungshaltung an dich haben.

## Zeitrahmen
Bitte timeboxe dich auf **max. 6-8 Stunden**.

> Hinweis: Wenn du nicht fertig wirst, ist das ok. Wir bewerten auch Teil-Ergebnisse - entscheidend ist, dass wir dein Vorgehen nachvollziehen können. Solltest du in diese Situation kommen, dokumentiere dein Plan für das weitere Vorgehen.

## Ziel
Baue eine kleine Flutter App mit einem spielbaren **Tic-Tac-Toe** (lokal auf einem Gerät). 

## Anforderungen (MVP)

### 1) Startscreen
- Die App startet auf einem Startscreen.
- Ein Button **Spiel starten!** navigiert zum Game Screen.

### 2) Game Screen
- Ein **3x3 Grid** (Tic-Tac-Toe Board).
- Spieler wechseln sich ab (**X** / **O**).
- Ein Feld kann **nur einmal** belegt werden.
- Das Spiel erkennt zuverlässig:
    - **X gewinnt**
    - **O gewinnt**
    - **Unentschieden**

### 3) Spielende
- Informiere den Nutzer eindeutig über das Ergebnis (z. B. Dialog/Snackbar/Screen - du entscheidest).
- Danach soll der Nutzer sinnvoll wieder in einen **Start-/Neustart**-Flow kommen (z. B. zurück zum Startscreen oder **neues Spiel**). Bitte begründe deine Wahl kurz.

## Qualitäts- & Struktur-Erwartungen
Wir achten besonders auf:
- **Nachvollziehbare Code Struktur & Architektur** (angemessener Scope für das Projekt, kein Overengineering)
- **Erweiterbarkeit** als Denkmodell (du musst die Erweiterungen nicht bauen, aber so strukturieren, dass sie später gut möglich wären, ohne das man alles komplett aufreissen muss)
- **Qualitätsbewusstsein** (Robustheit, Edge Cases, Code Sauberkeit)
- **Arbeitsweise** (Git-Verlauf, saubere Inkremente, Lesbarkeit)
- **Selbstständigkeit** (Wie gehst du mit offenen technischen Anforderungen um?)

## Arbeitsweise / Abgabe

### Git
- Bitte arbeite in einem **Git Repository**.
- Wir erwarten **mehrere sinnvolle Commits** mit verständlichen Messages.

### README (wichtig)
Lege im Repo eine kurze `README.md` an mit:
- Setup / **How to run**
- Annahmen & Scope (was hast du bewusst weggelassen?)
- Kurzer Überblick über die Struktur/Architektur
- Wichtigste Entscheidungen & Trade-offs - was waren die Möglichkeiten die du evaluiert hast und warum hast du dich dann für die genutzte Lösung entschieden?
- **Next steps**: wie würdest du folgende Erweiterungen anbinden? Stichpunkte genügen
  - Online/Multiplayer
  - Persistenz (Spielstände/Statistiken)
  - Varianten (andere Boardgrößen, Regeln, Best-of-X)

### Abgabe
- Repo-Link (bevorzugt) oder Zip inkl. `.git` Ordner

## Optional (wenn du noch Zeit hast)
- Kleine UX-Verbesserungen (z. B. aktueller Spieler, **Play again**, etc.)
- Eine Skizze/Diagramm zur aktuellen (und ggf. geplanten Erweiterungs-) Architektur

## Was wir im Follow-up besprechen
Nach der Abgabe machen wir typischerweise ein kurzes Gespräch (ca. 20-30 Minuten):
- Walkthrough: Wie ist das Projekt aufgebaut?
- Priorisierung: Was kam zuerst und warum?
- Qualität: Wie hast du Korrektheit abgesichert? Was wären die nächsten Refactorings?
- Evolution: Was müsste sich ändern für (z. B.) 4x4 Board oder Multiplayer?

---

Vielen Dank - wir freuen uns auf deine Lösung.
