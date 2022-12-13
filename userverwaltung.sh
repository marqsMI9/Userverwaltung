#!/bin/bash

#Userverwaltung
#Autor: Calvin, Markus, Metehan, Michael
#E-mail: hoermannca@elektronikschule.de, roesslerma@elektronikschule.de, karakocame@elektronikschule.de, roesslermi@elektronikschule.de
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


function groupdel(){
        groupname=$(kdialog --inputbox "Wie ist der Name der Gruppe die Sie löschen wollen:")
        löschort=$(kdialog --inputbox "Wo wollen sie die gruppe löschen:")
        until [ $yesno == 0 ]
	do
              yesno=$(kdialog --yesno "Sind sie sich sicher, dass Sie die Gruppe $groupname in $löschort  löschen wollen?")
        done
        id $groupname 2&> /dev/null
	if [ $? = 0 ]
	then 
		kdialog --msgbox "Group $username wurde nicht gefunden. "
	else 
		kdialog --msgbox "User $username wird gelöscht."
                cd $löschort
                groupdel $groupname
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
