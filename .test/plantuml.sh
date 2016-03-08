#!/usr/bin/env bash
echo '@startuml' > diagrama.puml

base_dir=/home/dokku/

sudo find $base_dir -name "*.env"|while read fname; do
  component_name=${fname%/*}
  component_name=${component_name/$base_dir/''}
  echo "[$component_name]" >> diagrama.puml
  echo "note bottom of [$component_name]" >> diagrama.puml
  while IFS=':' read -r key value
  do
    if [ ! -z "$key" ]; then
    	var_value=$(dokku config:get $component_name $key)    
    	if [ ! -z "$var_value" ]; then
    		echo "$key = $var_value" >> diagrama.puml
    	fi
    fi
  done < <(grep "^[[:alnum:]]" "$fname")
  echo "end note" >> diagrama.puml
done

sudo find $base_dir -name "*.app"|while read fname; do
  component_name=${fname%/*}
  component_name=${component_name/$base_dir/''}
  while IFS=':' read -r key value
  do
    if [ ! -z "$key" ]; then
    	echo "[$component_name] --> [$key] : dependecy" >> diagrama.puml
    fi
  done < <(grep "^[[:alnum:]]" "$fname")
done

echo '@enduml' >> diagrama.puml