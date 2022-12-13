#!/bin/bash

#Userverwaltung
#Autor: Calvin, Markus, Metehan, Michael
#Email: hoermannca@elektronikschule.de, roesslerma@elektronikschule.de, karakocame@elektronikschule.de, roesslermi@elektronikschule.de
#Version: 1.0.0

function menu(){
        clear
        echo "|----------------------------------------------|"
        echo "| Haupmenu:                                    |"
        echo "|                                              |"
        echo "|      Gruppe hinzufügen:     a                |"
        echo "|      Gruppe löschen:        d                |"
        echo "|      Nutzer hinzufügen:     h                |"
        echo "|      Nutzer löschen:        l                |"
        echo "|      Programm beenden:      X                |"
        echo "|                                              |"
        read -p "| Eingabe: " EINGABE
}

function useradd(){
        username=$(kdialog --inputbox "Geben Sie den zuhinzufügenden Nutzer an:")
        speicherort=$(kdialog --inputbox "An welchem Ort soll der Nutzer gespeichert werden:")
        until [ $yesno == 0 ]
	do
              yesno=$(kdialog --yesno "Sind sie sich sicher, dass Sie den Benutzer $username in $speicherort speichernwollen?")
        done
        id $username 2&> /dev/null
	if [ $? = 0 ]
	then 
		kdialog --msgbox "User $username vorhanden"
	else 
		kdialog --msgbox "User $username wird erstellt."
                cd $speicherort
                useradd $username
        fi
}


while :
do
          menu
          case $EINGABE in
                a|A)
                        groupadd
                        ;;
                d|D)
                        groupdel
                        ;;
                h|H)
                        useradd
                        ;;
                l|L)
                        userdel
                        ;;
                  *)
                        echo "Und tschüss!"
                        exit 1
            esac
            sleep 2
done 

exit 0
done
