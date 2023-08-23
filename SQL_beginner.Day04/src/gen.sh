#!/bin/bash
p=$2

for (( i=0; i <= "$1"; i++ ))
do
    mkdir "ex0$i"
    cd "ex0$i"
    touch "day0$p"_"ex0$i.sql"
    cd ..
done