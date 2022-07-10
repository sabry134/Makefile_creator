#! /bin/bash

if [ $# -eq 0 ]
  then
    exit 84
fi

p="Weekly_Report.txt"
dir=$(grep -s "PROJECT_DIR" $1 | cut -d ";" -f 2)
read mon day year < <(date -d "2 days" "+%b %_d %Y")
testdate="$mon $day $year"

if test -f "$1"; then
    if [ -s $1 ]; then
        if [ -e $dir/$p ]; then
            rm $dir/$p
        else
            touch $dir/$p
        fi
        if grep -q "DATE" $1;
        then
        exec=$(grep -s "DATE" $1 | cut -d ";" -f 1)
        echo -e "Weekly Report made on $testdate\n" >> $dir/$p
        fi

        if grep -q "FB" $1;
        then
        exec=$(grep -s "FB" $1 | cut -d ";" -f 1)
        bin=$(grep -s "FB" $1 | cut -d ";" -f 2)
        echo -e "=================== Feedbacks ===================\n" >> $dir/$p
        echo -e "$bin" >> $dir/$p
        fi

        if grep -q "SU" $1;
        then
        exec=$(grep -s "SU" $1 | cut -d ";" -f 1)
        bin=$(grep -s "SU" $1 | cut -d ";" -f 2)
        echo -e "\n=================== Suggestions ===================\n" >> $dir/$p
        echo -e "$bin" >> $dir/$p
        fi

        if grep -q "QS" $1;
        then
        exec=$(grep -s "QS" $1 | cut -d ";" -f 1)
        bin=$(grep -s "QS" $1 | cut -d ";" -f 2)
        echo -e "\n=================== Questions ===================\n" >> $dir/$p
        echo -e "$bin" >> $dir/$p
        fi
        if grep -q "MORE" $1;
        then
        exec=$(grep -s "MORE" $1 | cut -d ";" -f 1)
        bin=$(grep -s "MORE" $1 | cut -d ";" -f 2)
        echo -e "\n=================== Additional Informations ===================\n" >> $dir/$p
        value=`cat $1`
        value="${value#*MORE;}"
        value="${value%%END*}" 
        echo -e "$value" >> $dir/$p
        fi
        echo -e "\n========================================================" >> $dir/$p
    else
        exit 84
    fi
else
    exit 84
fi