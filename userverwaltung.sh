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
