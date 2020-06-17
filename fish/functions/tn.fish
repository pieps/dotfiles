function tn -d 'Create new tmux session'
  if count $argv > 0
    tmux new -s $argv
  else
    tmux new -s (basename (pwd))
  end
end
