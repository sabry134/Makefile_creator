#! /bin/bash

if [ $# -eq 0 ]
  then
    exit 84
fi


p="Makefile"
dir=$(grep -s "PROJECT_DIR" $1 | cut -d ";" -f 2)

tableau={$line}
IFS=";"

if test -f "$1"; then
    if [ -s $1 ]; then
        if [ -e $dir/$p ]; then
            rm $dir/$p
        else
            touch $dir/$p
        fi
        backslash="\\"
        bcn="\\n"
        b="SRC"
        if grep -q "EXEC" $1;
        then
        exec=$(grep -s "EXEC" $1 | cut -d ";" -f 1)
        bin=$(grep -s "EXEC" $1 | cut -d ";" -f 2)
        echo -e "$exec = \t $bin\n" >> $dir/$p
        else
        bin="a.out"
        exec="EXEC"
        echo -e "EXEC = \t $bin\n" >> $dir/$p
        fi


        project=$(grep -s "PROJECT_DIR" $1 | cut -d ";" -f 1)
        echo -e "$project = \t $dir\n" >> $dir/$p
        clc=$(grep -s "calc.c" $1| cut -d ";" -f 1)
        main=$(grep -s "main.c" $1 | cut -d ";" -f 1)
        echo -e "SRC = \t$clc\t$backslash" >> $dir/$p
        echo -e "\t\t$main\t$backslash" >> $dir/$p
        g="$"
        h="("
        i="SRC:.c=.o"
        j=")"
        k=$g$h$i$j
        obj="OBJ"
        echo -e "\n$obj = \t $k\n" >> $dir/$p
        if grep -q "CC" $1;
        then
            cc=$(grep -s "CC" $1 | cut -d ";" -f 1)
            clang=$(grep -s "CC" $1 | cut -d ";" -f 2)
            echo -e "$cc = \t $clang\n" >> $dir/$p
        fi
        if grep -q "SOURCES_DIR" $1;
        then
            source=$(grep -s "SOURCES_DIR" $1 | cut -d ";" -f 1)
            sdir=$(grep -s "SOURCES_DIR" $1 | cut -d ";" -f 2)
            echo -e "$source = \t $sdir\n" >> $dir/$p
        fi
        if grep -q "CFLAG" $1;
        then
            cflag=$(grep -s "CFLAG" $1 | cut -d ";" -f 1)
            test=$(grep -s "CFLAG" $1 | cut -d ";" -f 2)
            echo -e "$cflag = \t $test\n" >> $dir/$p
        fi
        if grep -q "HEADERS_DIR" $1;
        then
            header=$(grep -s "HEADERS_DIR" $1 | cut -d ";" -f 1)
            headdir=$(grep -s "HEADERS_DIR" $1 | cut -d ";" -f 2)
            echo -e "$header = \t $headdir\n" >> $dir/$p
        fi
        if grep -q "LIBS_DIR" $1;
        then
            libs=$(grep -s "LIBS_DIR" $1 | cut -d ";" -f 1)
            libra=$(grep -s "LIBS_DIR" $1 | cut -d ";" -f 2)
            echo -e "$libs = \t $libra\n" >> $dir/$p
        fi
        if grep -q "BCK_DIR" $1;
        then
            bck=$(grep -s "BCK_DIR" $1 | cut -d ";" -f 1)
            bup=$(grep -s "BCK_DIR" $1 | cut -d ";" -f 2)
            echo -e "$bck = \t $bup\n" >> $dir/$p
        fi
        if grep -q "ZIP" $1;
        then
            ziz=$(grep -w "ZIP" $1 | cut -d ";" -f 1)
            zizv=$(grep -w "ZIP" $1 | cut -d ";" -f 2)
            echo -e "$ziz =\t$zizv\n" >> $dir/$p
        fi
        if grep -q "ZIPFLAGS" $1;
        then
            zizf=$(grep -w "ZIPFLAGS" $1 | cut -d ";" -f 1)
            zizfv=$(grep -w "ZIPFLAGS" $1 | cut -d ";" -f 2)
            echo -e "$zizf = \t$zizfv\n" >> $dir/$p
        fi
        if grep -q "UNZIP" $1;
        then
            unzip=$(grep -w "UNZIP" $1 | cut -d ";" -f 1)
            unzipv=$(grep -w "UNZIP" $1 | cut -d ";" -f 2)
            echo -e "$unzip = \t$unzipv\n" >> $dir/$p
        fi
        if grep -q "UNZIPFLAGS" $1;
        then
            unzipf=$(grep -w "UNZIPFLAGS" $1 | cut -d ";" -f 1)
            unzipfv=$(grep -w "UNZIPFLAGS" $1 | cut -d ";" -f 2)
            echo -e "$unzipf = \t$unzipfv\n" >> $dir/$p
        fi
        rule1="$"
        rule2="("
        rule3=")"
        c=$rule1$rule2$exec$rule3
        echo -e "all: \t $c\n" >> $dir/$p
        echo -e "$rule1$rule2$exec$rule3: $rule1$rule2$obj$rule3" >> $dir/$p
        echo -e "\tgcc -o $rule1$rule2$exec$rule3 $rule1$rule2$obj$rule3 $rule1$rule2$cflag$rule3\n" >> $dir/$p
        echo -e "clean:" >> $dir/$p
        echo -e "\trm -f $rule1$rule2$obj$rule3\n" >> $dir/$p
        echo -e "fclean: clean" >> $dir/$p
        echo -e "\trm -f $rule1$rule2$exec$rule3\n" >> $dir/$p
        echo -e "re:\tfclean all\n" >> $dir/$p
        echo -e "archive:" >> $dir/$p
        i=1
        echo -e "\t$zizv $zizfv $rule1$rule2$bck$rule3-$i.$zizv ../$rule1$rule2$project$rule3 $rule1$rule2$b$rule3" >> $dir/$p
        if [ -d "backup" ]; then
        echo -e "\tmv $rule1$rule2$bck$rule3-$i.$zizv $rule1$rule2$bck$rule3/" >> $dir/$p
        else
        mkdir backup
        echo -e "\tmv $rule1$rule2$bck$rule3-$i.$zizv $rule1$rule2$bck$rule3/" >> $dir/$p
        fi
        echo -e "\t@echo $rule1$rule2$bck$rule3 file generated\n" >> $dir/$p
        echo -e "revert:" >> $dir/$p
        echo -e "\t$unzipv $unzipfv $rule1$rule2$bck$rule3/$rule1$rule2$bck$rule3-$i.$unzipv -C ../$rule1$rule2$project$rule3\n" >> $dir/$p
        echo -e "num:" >> $dir/$p
        echo -e "\t@echo $i\n" >> $dir/$p
        echo -e "delete:" >> $dir/$p
        echo -e "\trm -rf $rule1$rule2$bck$rule3/$rule1$rule2$bck$rule3-$i.$zizv\n" >> $dir/$p
        echo -e ".PHONY: clean fclean re all\n" >> $dir/$p
    else
        exit 84
    fi
else
    exit 84
fi