function killij -d 'Kill running IntelliJ'
  jps -v | grep intellij | awk '{ print $1 }' | xargs -I{} kill {}
end
