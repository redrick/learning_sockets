if [ $1 ]
  then
    telnet $1 2626
  else
    telnet localhost 2626
fi

