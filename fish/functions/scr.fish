function scr -d 'Reconnect to a screen session. If it does not exist, change directory to specified CITC client and create a screen session with the same name'
  set client $argv[1]
  screen -r $client > /dev/null 2>&1 || begin
    cd (p4 g4d $client) && screen -S $client
  end
end
