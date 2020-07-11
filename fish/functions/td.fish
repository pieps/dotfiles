function td -d 'Create new tmux session without attaching'
  if test (count $argv) -gt 0
    set tmux_session $argv[1]
  else
    set tmux_session (pwd)
  end
  if not tmux has-session -t (basename $tmux_session) 2> /dev/null
    tmux new -ds (basename $tmux_session) -c $tmux_session
  end
end
