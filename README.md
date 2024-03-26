![0dd583b7-006d-4eee-b077-c8c13d5c921b](https://github.com/MeltPine/KLIPPER-Uptdate/assets/163598057/ae268060-f747-44cb-96b1-1bb68da3ea34)

#### WICHTIG `SERIAL & MCU` MÜSSEN mit den eigenen passen, diese müssen in der "KLIPPER-Update.sh" angepasst werden diese findet man in der  "printer.cfg" #### 

Dieses Skript, erstellt von MeltPine, automatisiert den Prozess zum Flashens von Klipper Firmware für verschiedene Mikrocontroller-Einheiten 
(MCUs) in einem 3D-Druck-Setup, das CAN-Bus für die Kommunikation nutzt. 
Es beinhaltet auch Optionen für die Installation notwendiger Abhängigkeiten und das Management des Klipper-Dienstes auf dem Host-Computer (typischerweise ein Raspberry Pi).


Hier ist eine Zusammenfassung der Funktionsweise des Skripts:

1. Vorbereitung und Abhängigkeiten**: Das Skript prüft, ob `python3-pyserial` installiert ist und bietet an, es bei Bedarf zu installieren. Dies ist für die Kommunikation mit den MCUs notwendig.

2. Klipper-Service-Management**: Der Benutzer wird gefragt, ob der Klipper-Dienst gestoppt werden soll, was für das Flashen der Firmware erforderlich ist.

3. CanBoot Installation**: Es wird geprüft, ob Katapult, ein Bootloader für das Flashen von Firmware über CAN-Bus, installiert ist und bietet eine Installationsoption an, falls es fehlt.

4. Anzeige von CAN-Bus IDs**: Das Skript kann vorhandene CAN-Bus IDs anzeigen, was für die korrekte Zuweisung der Firmware zu den Geräten wichtig ist.

5. Konfiguration und Flashing:
   - Das Skript erlaubt das Kompilieren der Firmware mit spezifischen Einstellungen für alle MCU's  U2C Bridge (für die USB-zu-CAN-Kommunikation).
   - Die konfigurierte Firmware wird dann entweder über USB direkt oder über CAN-Bus (für Geräte, die CanBoot unterstützen) geflasht.

7. **Wiederherstellung des Klipper-Dienstes**: Zum Schluss bietet das Skript an, den Klipper-Dienst wieder zu starten, um den normalen Betrieb fortzusetzen.

Das Skript nutzt klare Anweisungen und Bestätigungen, um den Benutzer durch jeden Schritt zu führen, 
wobei die Sicherheit (durch das Stoppen/Starten des Klipper-Dienstes) und Benutzerfreundlichkeit (durch Optionen zur Installation und einfache Auswahlmöglichkeiten) 
im Vordergrund stehen. Es ist ein praktisches Werkzeug für Anwender, die mehrere 3D-Drucker MCUs effizient verwalten und aktualisieren möchten, insbesondere in komplexen Setups mit CAN-Bus-Kommunikation.
