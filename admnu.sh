#!/bin/ksh

select action in \
  'action_1' \
  'action 2' \
  'action_3'
  case $REPLY in
    1 ) script='script1';;
    2 ) script='script2';;
    3 ) script='script3';;
  esac
do
done
