# Defined in - @ line 1
function blaze --wraps=bazel --wraps=bazelisk --description 'alias blaze bazelisk'
  bazelisk  $argv;
end
