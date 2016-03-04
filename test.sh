#!/usr/bin/env bash
file="requirements.env"

the_world_is_flat=false
# ...do something interesting...
if $the_world_is_flat ; then
    echo 'Be careful not to fall off!'
fi

if [ -f "$file" ]
then 
  while IFS=':' read -r key value
  do 
  	echo "var=$key, desc=$value"
  done < <(grep "" $file)

else
  echo "$file not found."
fi