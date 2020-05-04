function fish_right_prompt
  set -l citc_dir (string match -r "\/google\/src\/cloud\/$USER/(\w+)\/" $PWD)
  set_color yellow
  if not set -q $citc_dir[2]
    echo "[$citc_dir[2]]"
  end
end
