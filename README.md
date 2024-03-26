<p align="left">
  <img src="https://github.com/MeltPine/KLIPPER-Uptdate/assets/163598057/dfe284d6-9665-47b2-ade3-dda7027ada49" width="220">
</p>

English scroll down

#### WICHTIG `SERIAL & MCU` MÜSSEN mit den eigenen Werten passen, diese müssen in der "KLIPPER-Update.sh" angepasst werden. Die Werte findet man in der   "printer.cfg" #### 

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
___________________________________________________________________________

#### IMPORTANT: `SERIAL & MCU` MUST match your own values, these need to be adjusted in the "KLIPPER-Update.sh" file. The values can be found in the "printer.cfg" file. ####

This script, created by MeltPine, automates the process of flashing Klipper firmware for various microcontroller units (MCUs) in a 3D printing setup that utilizes CAN bus for communication. It also includes options for installing necessary dependencies and managing the Klipper service on the host computer (typically a Raspberry Pi).

Here's a summary of how the script works:

1. **Preparation and Dependencies**: The script checks if `python3-pyserial` is installed and offers to install it if necessary. This is necessary for communication with the MCUs.

2. **Klipper Service Management**: The user is prompted whether to stop the Klipper service, which is required for flashing the firmware.

3. **CanBoot Installation**: It checks if Katapult, a bootloader for flashing firmware over CAN bus, is installed and provides an installation option if it's missing.

4. **Display CAN Bus IDs**: The script can display existing CAN bus IDs, which is important for correctly assigning firmware to devices.

5. **Configuration and Flashing**:
   - The script allows compiling the firmware with specific settings for all MCUs U2C Bridge (for USB-to-CAN communication).
   - The configured firmware is then flashed either directly via USB or via CAN bus (for devices that support CanBoot).

6. **Restoration of Klipper Service**: Finally, the script offers to restart the Klipper service to resume normal operation.

The script utilizes clear instructions and confirmations to guide the user through each step, prioritizing safety (through stopping/starting the Klipper service) and user-friendliness (through installation options and simple selection choices). It's a handy tool for users who want to efficiently manage and update multiple 3D printer MCUs, especially in complex setups with CAN bus communication.

<p align="left">
  <img src="https://github.com/MeltPine/KLIPPER-Uptdate/assets/163598057/c5d57f4f-aa25-4bef-83b4-ca8704d9f5fe" width="220">
</p>




                                                                                                                                                                               
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
