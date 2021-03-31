function tt -d 'Get pstree info for the given named process running in the current tmux session'
  if test (count $argv) -ne 1
    echo 'tt must be called with a single process name'
    return 1
  end
  set tmux_session (tmux display -p "#S")
  set pids (tmux list-panes -a -F '#{pane_pid} #{session_name} #{window_name}' | grep (string join ' ' $tmux_session $argv[1]) | awk '{ print $1 }')
  if test (count $pids) -gt 0
    for pid in $pids
      pstree -p $pid
    end
  else
    echo "No processes named '$argv[1]' found in session '$tmux_session'"
  end
end
