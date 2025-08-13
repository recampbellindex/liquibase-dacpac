#!/bin/bash

liquibase status > status.log

cat status.log

export STATUS=`cat status.log | awk -F '::' '{printf $2"\n"}'`
echo STATUS=${STATUS}

string_list=($(echo $STATUS))

for str in "${string_list[@]}"; do
  echo "DACPAC found: $str"
done

if [ -d "output" ]; then
    echo "Previous output directory exists. Removing ..."
    rm -rf output
fi

echo "Create new output directory ..."
mkdir output

for str in "${string_list[@]}"; do
  echo "Current string: $str"
  scripts/scriptDacPac.sh scripts/exports.sh dacpac/NPT-1.0.dacpac output/${str}.sql
  cat output/$str.sql >> output/outputScript.sql
done

rm status.log

