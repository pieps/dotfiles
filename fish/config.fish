set -gx EDITOR nvim

if functions -q source_google_fish_package
  #  source_google_fish_package hi
  source_google_fish_package buildfix
end

if [ "$XDG_SESSION_TYPE" = "wayland" ]
  export MOZ_ENABLE_WAYLAND=1
end
