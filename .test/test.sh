#!/usr/bin/env bash

while IFS=':' read -r key value
  do
    echo $key
  done < <(grep "^[[:alnum:]]" "requirements.txt")