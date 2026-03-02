# Tic Tac Toe Challenge

## Setup & Start
Um das Projekt lokal zu starten, sind folgende Schritte nötig:
* Repository klonen und in den Projektordner navigieren.
* Im Terminal `flutter pub get` ausführen, um alle Abhängigkeiten (z.B. Bloc, Equatable) zu laden.
* Die App mit `flutter run` auf einem Emulator oder Device starten.
* Die Spiellogik kann separat mit `flutter test` geprüft werden.

## Annahmen & Scope
Für diese Challenge bin ich davon ausgegangen, dass zwei Spieler das Spiel abwechselnd an einem gemeinsamen Gerät bedienen (Local Multiplayer). 

Bewusst weggelassen habe ich einen komplexen `data`-Layer mit Repositories. Da die App aktuell keine Daten von externen Quellen (API/Datenbank) bezieht oder dauerhaft speichert. Um den Fokus auf die Architektur zu legen habe ich auf komplexes UX-Design, mit Animationen oder weiteres verzichtet. Dennoch habe ich eine **AppBar** hinzugefügt, da diese für die Navigation und das "App-Gefühl" (z.B. Zurück-Button) essentiell ist.


## Struktur & Architektur
Ich habe mich für eine **Feature-first** Struktur entschieden - Aufteilung der Ordner nach Features (game, start). 
* **Business Logic**: Das State-Management wird über das **BLoC Pattern** gelöst, um UI und Logik strikt zu trennen. 
* **Domain Layer**: Die `GameEngine` ist die "Single Source of Truth" für die Gewinn-Regeln und völlig unabhängig von Flutter (Pure Dart).
* **TDD**: Die Kernlogik (Gewinn-Abfrage) wurde testgetrieben entwickelt.
* **Styling**: Analog zu zentralen CSS-Dateien in der Web-Entwicklung nutze ich eine dedizierte `AppTheme`-Datei, um Farben und Styles zentral zu steuern.

## Wichtige Entscheidungen & Trade-offs
* **1D-Liste für das Board**: Statt eines 2D-Arrays (`List<List<String>>`) nutze ich eine flache Liste mit 9 Feldern. Das passt perfekt zum `GridView.builder` von Flutter, der über einen fortlaufenden Index arbeitet. Eine 1D-Liste verhindert unnötige Index-Umrechnungen und hält den Code simpler.
* **Scoped BLoC**: Der `GameBloc` wird nicht global, sondern erst beim Navigieren zum Spiel über einen `BlocProvider` in der Route bereitgestellt. Spart Ressourcen -> da der BLoC automatisch gelöscht wird, wenn der Screen verlassen wird.
Dadurch musste ich nicht sowas wie resetGame auch in der AppBar beim zurücknavigieren ausführen.

### Online-Multiplayer
* Neuer Screen für Modus-Wahl und Nicknames.
* Implementierung von "GameRooms" über Unique Keys.
* Ein Repository-Layer würde die lokalen Events an ein Backend (WebSockets/Firebase) senden, statt sie nur lokal zu verarbeiten.
* Ein `MakeMove`-Event würde dann nicht mehr nur lokal den State ändern, sondern den Zug an einen Server senden.

### Persistenz (Spielstände/Statistiken)
* Repository für lokalen Speicher (z.B. Shared Preferences) oder eine Online-Datenbank
* Datenbank-Anbindung für Online-Statistiken oder zum Zwischenspeichern laufender Partien.

### Varianten (Boardgrößen & Regeln)
* Die `GameEngine` ist bereits so aufgebaut, dass sie leicht erweitert werden kann. Man könnte Parameter für die Feldgröße oder die Anzahl der benötigten Zeichen für einen Sieg hinzufügen. 
* Da die UI (`GridView`) dynamisch auf die Listenlänge reagiert, müsste kaum Code dupliziert werden. Jede Variante könnte als Konfiguration an denselben BLoC übergeben werden.

## Architektur-Skizze
Das folgende Diagramm zeigt den aktuellen Datenfluss und wie zukünftige Erweiterungen (gestrichelt) angebunden würden:
```mermaid
graph TD
    A[StartScreen] -->|Navigator.push| B[GameScreen]
    B --> C[BlocProvider / GameBloc]
    C --> D[GameView]
    D -->|MakeMove Event| C
    C -->|Check Rules| E[GameEngine Domain]
    E -->|Winner/Draw| C
    C -->|New State| D
    
    subgraph "Zukünftige Erweiterungen"
    F[Local Storage / DB]
    G[Online Service / API]
    end
    
    C -.-> F
    C -.-> G