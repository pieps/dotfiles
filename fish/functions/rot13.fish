function rot13 --wraps=tr\ \'A-Za-z\'\ \'N-ZA-Mn-za-m\' --description alias\ rot13=tr\ \'A-Za-z\'\ \'N-ZA-Mn-za-m\'
  tr 'A-Za-z' 'N-ZA-Mn-za-m' $argv; 
end
