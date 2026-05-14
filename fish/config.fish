set -gx EDITOR nvim

fzf --fish | source

if functions -q source_google_fish_package
  #  source_google_fish_package hi
  source_google_fish_package buildfix
  source_google_fish_package autogcert
end

if [ "$XDG_SESSION_TYPE" = "wayland" ]
  export MOZ_ENABLE_WAYLAND=1
end

if status is-interactive
  # Commands to run in interactive sessions can go here
  starship init fish | source
end
