#!/bin/bash

HELP="Syntax : $0 path/to/train_euro2016/"

if (( $# == 0 ))
then
  echo $HELP >&2
  exit
fi

path=$1

find $path -name "*.json" | while read file
do
  printf "%s -> " "$file" >&2
  ( ./parse_json_line.lua < $file > ${file}.tsv && printf "%s\n" >&2) || printf "error\n" >&2
  exit
done
