#! /bin/bash

OUTPUTS="$1"
REPORT="$2"

list=$(ls $OUTPUTS)

for user_list in $list; do
    user_count=$(ls $OUTPUTS/$user_list | wc -l)
    echo -e "Found $user_count users(s) in $user_list/"

    rm -f "$REPORT"
    for user in "$OUTPUTS/$user_list"/*; do
        cut -d: -f2- "$user" | sed 's/^[[:space:]]*//' | tr '\n' ';' >> $REPORT
        echo >> $REPORT
    done
done