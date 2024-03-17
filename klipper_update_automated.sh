#!/bin/bash
#
# by MeltPine
#
# zum erstellen neuer config's
#Serial Name (ls /dev/serial/by-id/*)
U2C_MCU="usb-katapult_stm32g0b1xx_1000490009504D4D35383820-if00"
M8P_MCU="usb-Klipper_stm32h723xx_300027000F51313236343430-if00"	
ERCF_MCU="usb-Klipper_rp2040_E66254955333AB2A-if00"


#CANID (~/klippy-env/bin/python ~/klipper/scripts/canbus_query.py can0)
U2C_MCU_CANID="987e8b5638fa"
SB2240_MCU_CANID="cc2af7c5e8a5"

header0=$(echo -e "\033[31m######################################################################################\033[0m")
header1=$(echo -e "\033[31m###\033[0m\033[33m Auto kompilieren und upgraden aller Klipper Canbus MCU's powered by MeltPine \033[0m\033[31m###\033[0m")
header2=$(echo -e "\033[31m######################################################################################\033[0m")

clear
echo -e "$header0\n$header1\n$header2\n\n"
echo ""
read -p "Zum flashen brauchen wir python3-pyserial, soll ich es installieren oder ohne weiter machen. (y/n)? " serial
case ${serial:0:1} in
    y|Y )

	echo -e "\033[31mPySerial mit pip3 installieren\033[0m"
	pip3 install pyserial
	echo -e "\033[31mPySerial ist nun installiert\033[0m"
	sleep 2
	    ;;
    * )
	clear
	echo -e "\033[32mSomit machen wir ohne Installation weiter machen. \033[0m"
    ;;
esac



clear
echo -e "$header0\n$header1\n$header2\n\n"
echo ""
read -p "Bevor wir loslegen müssen wir den Klipper Service stoppen (y/n)? " stoppen
case ${stoppen:0:1} in
    y|Y )

	echo -e "\033[31mKlipper stoppen\033[0m"
	sudo service klipper stop
	echo -e "\033[32mKlipper Service gestopt \033[0m"
	sleep 2
	    ;;
    * )
	clear
	echo -e "\033[32mSomit können wir nicht im Script weiter machen. \033[0m"
	exit
    ;;
esac



clear
echo -e "$header0\n$header1\n$header2\n\n"
echo ""
read -p "Haben sie katapul installiert ? (y/n)? " answer_ins1
case ${answer_ins1:0:1} in
    y|Y )


					;;
			    * )
			clear
			echo -e "$header0\n$header1\n$header2\n\n"
			echo ""
			read -p "Soll ich es für Sie Installieren ?  (y/n)? " answer_ins2
			case ${answer_ins2:0:1} in
			    y|Y )

					cd ~
					git clone https://github.com/Arksine/katapult.git

					echo -e "\033[32mBitte katabult zu Ihrer passenden Hardware kompilieren und flashen. \033[0m"
					echo -e "\033[32mz.B Wie siehe auf https://github.com/docgalaxyblock/KlipperMisc/blob/main/CAN/BigTreeTech-U2C/README.md \033[0m"
					exit
			    ;;
			esac

	    ;;
    * )

    ;;
esac



clear
echo -e "$header0\n$header1\n$header2\n\n"
echo ""
read -p "Wollen Sie sich die Canbus IDs der vorhandenen Geräte anzeigen lassen (y/n)? " answer1
case ${answer1:0:1} in
    y|Y )

	~/klippy-env/bin/python ~/klipper/scripts/canbus_query.py can0

echo -e "\033[32mBitte die Canbus IDs in diesem Script am Anfang einfügen. \033[0m"
echo -e "\033[32mWenn man nicht weis welche Can ID welchem Gerät gehört, einfach das Script mehrfach starten mit der jeweiligen Hardware allein. \033[0m"
exit
	    ;;
    * )

    ;;
esac



clear
echo -e "$header0\n$header1\n$header2\n\n"
echo ""
read -p "Haben Sie in diesem Script am Anfang Ihre Canbus IDs und U2C_MCU Serial eingetragen ? (y/n)? " canid
case ${canid:0:1} in
    y|Y )


	    ;;
    * )
	echo -e "\033[32mBitte die Canbus IDs in diesem Script am Anfang eintragen. \033[0m"
	echo -e "\033[Wenn man das Menü (Canbus IDs der vorhandenen Geräte anzeigen) bestätigt, werden Ihnen die IDs angezeigt.\033[0m"
exit
    ;;
esac



cd ~/klipper

clear
echo -e "$header0\n$header1\n$header2\n\n"
echo ""
read -p "MCU config anpassen (y/n)? " answer1
case ${answer1:0:1} in
    y|Y )

clear
echo -e "$header0\n$header1\n$header2\n\n"
echo ""    
echo -e "Klipper config erstellen für das \033[32mSB2240\033[0m"
sleep 5
make KCONFIG_CONFIG=sb2240 			OUT=out-sb2240/  	menuconfig
sleep 2

clear
echo -e "$header0\n$header1\n$header2\n\n"
echo ""
echo -e "Klipper config erstellen für die \033[32mERCF\033[0m"
sleep 5
make KCONFIG_CONFIG=ercf 			OUT=out-ercf/  	menuconfig
sleep 2

clear
echo -e "$header0\n$header1\n$header2\n\n"
echo ""
echo -e "Klipper config erstellen für die \033[32mU2C Bridge\033[0m"
sleep 5
make KCONFIG_CONFIG=u2c 		  	OUT=out-u2c/  	menuconfig
sleep 2

clear
echo -e "$header0\n$header1\n$header2\n\n"
echo ""
echo -e "Klipper Konfiguration erstellen für das \033[32mManta M8P v2\033[0m"
sleep 5
make KCONFIG_CONFIG=m8p_v2 	  	OUT=out-m8p_v2/  	menuconfig
sleep 2
	    ;;
    * )

    ;;
esac



clear
echo -e "$header0\n$header1\n$header2\n\n"
echo ""
read -p "MCU Konfiguration Flashen (y/n)? " answer2
case ${answer2:0:1} in
    y|Y )
  

	echo -e "\033[33mUpgraden aller Klipper MCU's powered by 3DArtmaker\033[0m"
	sleep 5

clear
echo -e "$header0\n$header1\n$header2\n\n"
echo ""
	echo -e "\033[31mKlipper Clean alte Files\033[0m"
	sleep 5
	make KCONFIG_CONFIG=sb2240        OUT=out-sb2240/ clean
	make KCONFIG_CONFIG=ercf        OUT=out-ercf/ clean
	make KCONFIG_CONFIG=u2c 		  OUT=out-u2c/ clean
	make KCONFIG_CONFIG=m8p_v2 	  	  OUT=out-m8p_v2/ clean
	echo -e "\033[32mKlipper Clean fertig \033[0m"
	echo ""
clear
echo -e "$header0\n$header1\n$header2\n\n"	
echo ""
	echo ""
	M8P_MCU_USB=/dev/serial/by-id/"$M8P_MCU"
	echo -e "\033[31mM8P MCU kompilieren\033[0m"
	make -j4 KCONFIG_CONFIG=m8p_v2       OUT=out-m8p_v2/  > /dev/null
	echo -e "\033[31mM8P MCU Boot in Flash Command\033[0m"
	make -j4 KCONFIG_CONFIG=m8p_v2       OUT=out-m8p_v2/ flash FLASH_DEVICE=$M8P_MCU_USB
	sleep 5
	echo -e "\033[32mM8P MCU fertig geflasht\033[0m"
clear
echo -e "$header0\n$header1\n$header2\n\n"
echo ""
	# zum kompelieren neuer Software
	echo -e "\033[31mSB2240 CANBUS MCU kompilieren\033[0m"
	make -j4 KCONFIG_CONFIG=sb2240    OUT=out-sb2240/  > /dev/null
	echo -e "\033[31mSB2240 MCU flashen über Canbus\033[0m"
	python3 ~/CanBoot/scripts/flash_can.py -i can0 -f ~/klipper/out-sb2240/klipper.bin -u $SB2240_MCU_CANID
	echo -e "\033[32mSB2240 MCU flashen fertig \033[0m"
	echo -e "\033[32mSB2240 MCU CANBUS fertig \033[0m"
	echo ""
clear
echo -e "$header0\n$header1\n$header2\n\n"	
echo ""
	echo ""
	ERCF_MCU_USB=/dev/serial/by-id/"$ERCF_MCU"
	echo -e "\033[31mERCF MCU kompilieren\033[0m"
	make -j4 KCONFIG_CONFIG=ercf       OUT=out-ercf/  > /dev/null
	echo -e "\033[31mERCF MCU Boot in Flash Command\033[0m"
	make -j4 KCONFIG_CONFIG=ercf       OUT=out-ercf/ flash FLASH_DEVICE=$ERCF_MCU_USB
	sleep 5
	echo -e "\033[31mERCF MCU fertig geflasht\033[0m"
clear
echo -e "$header0\n$header1\n$header2\n\n"	
echo ""
	echo -e "\033[31mU2C Bridge CANBUS MCU kompilieren\033[0m"
	make -j4 KCONFIG_CONFIG=u2c       OUT=out-u2c/  > /dev/null

	echo -e "\033[31mU2C Bridge Boot in Flash Command\033[0m"
	python3 ~/CanBoot/scripts/flash_can.py -r -i can0 -u $U2C_MCU_CANID
	sleep 5
	mcu_u2c=/dev/serial/by-id/"$U2C_MCU"

				if [ -e "$mcu_u2c" ]; then
				    if [ ! -L "$mcu_u2c" ]
				    then
				        echo -e "\033[31mDas U2C Modul ist nicht im Flash Modus und muss daher von Hand geflasht werden\033[0m"
				    else
				        echo -e "\033[32mOkay das U2C Modul ist im Flash Modus\033[0m"
		  				python3 ~/CanBoot/scripts/flash_can.py -f ~/klipper/out-u2c/klipper.bin -d $mcu_u2c
				    fi
				else
				  echo -e "\033[31mDas U2C Modul ist nicht im Flash Modus und muss daher von Hand geflasht werden\033[0m"
				fi


	echo -e "\033[32mU2C Bridge MCU CANBUS fertig \033[0m"


	    ;;
    * )

    ;;
esac



clear
echo -e "$header0\n$header1\n$header2\n\n"
read -p "Soll den Klipper Service wieder starten?. (y/n)? " answer1
case ${answer1:0:1} in
    y|Y )

	echo -e "\033[31mKlipper wieder starten\033[0m"
	sudo service klipper start
	echo -e "\033[32mKlipper Service gestartet \033[0m"
	echo ""
	echo -e "\033[33mVielen Dank für die Nutzung des Scripts von MeltPine\033[0m"

	    ;;
    * )
	echo -e "\033[32mSomit müssen Sie das selber machen. \033[0m"
    ;;
esac
