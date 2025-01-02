#!/bin/bash

dirs=("assign_c" "assign_c/output_IR" "assign_c/output_mem")
files=("run.sh" "overview.pdf" "checker.sh")

pass=true

for dir in "${dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        pass=false
        echo "$dir NOT FOUND"
    fi
done

for file in "${files[@]}"; do
    if [ ! -f "$file" ]; then
        pass=false
        echo "$file NOT FOUND"
    fi
done


irs=`ls ./assign_c/output_IR`
memirs=`ls ./assign_c/output_mem`

regex=".ll$"

for ir in $irs; do
    if [[ ! $ir =~ $regex ]]; then
        pass=false
        echo "$ir NOT REQUIRED"
    fi
done

for ir in $memirs; do
    if [[ ! $ir =~ $regex ]]; then 
        pass=false
        echo "$ir NOT REQUIRED"
    fi
done


var=`ls`

for name in $var; do
    temp=true
    for dir in "${dirs[@]}"; do
        if [ "$name" == "$dir" ]; then
            temp=false
        fi
    done
    for file in "${files[@]}"; do
        if [ "$name" == "$file" ]; then
            temp=false
        fi
    done
    if $temp; then
        pass=false
        echo "$name NOT REQUIRED"
    fi

done

if $pass; then
    echo "Accepted"
    printf '[ \u2714 ]\n'
else
    echo "Rejected"
    printf '[ \u274c ]\n'
fi
