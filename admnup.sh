#!/bin/ksh
SCRIPTS_HOME='/home/oracle/scripts'

typeset -r SLEEPTIME=15

REVON=$(tput smso)  # Reverse on.
REVOFF=$(tput rmso) # Reverse off.

while :
do
    clear
    print "\t    $REVON Data Guard system scripts $REVOFF"
    print
    print
    print "\tOptions:"
    print "\t---------------------------------------------"
    print "\t1) DG configuration     4) DB active services"
    print "\t2) DG validate          5) Option 5"
    print "\t3) DB details           6) Option 6"
    print
    print "\n\tOther Options:"
    print "\t----------------"
    print "\tr) Refresh screen"
    print "\tq) Quit"
    print
    print "\tEnter your selection: r\b\c"
    read selection
    if [[ -z "$selection" ]]
        then selection=r
    fi

    case $selection in
        1)  print "\nYou selected option 1"
            $SCRIPTS_HOME/dgmgrl_configuration.sh 
            sleep $SLEEPTIME
            ;;
        2)  print "You selected option 2"
            $SCRIPTS_HOME/dgmgrl_validate.sh 
            sleep $SLEEPTIME
            ;;
        3)  print "You selected option 3"
            $SCRIPTS_HOME/db_details.sh 
            sleep $SLEEPTIME
            ;;
        4)  print "You selected option 4"
            $SCRIPTS_HOME/q_v_active_services.sh
            sleep $SLEEPTIME
            ;;
        5)  ;&  #  Fall through example.
        6)  print "You selected option 5 or 6"
            sleep $SLEEPTIME
            ;;
      r|R)  continue
            ;;
      q|Q)  print
            exit
            ;;
        *)  print "\n$REVON Invalid selection $REVOFF"
            sleep 1
            ;;
    esac
done

