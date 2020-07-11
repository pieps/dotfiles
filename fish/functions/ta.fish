function ta -d 'Attach to tmux session'
  if test (count $argv) -gt 0
    set tmux_session '-t'(basename $argv)
  end

  if not set -q TMUX
    tmux a $tmux_session
  else if set -q tmux_session
    tmux switchc $tmux_session
  end
end
