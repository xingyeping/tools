#!/bin/sh

if [ $# != 3 ]; then
	echo 'Usage: format.sh executefile addressfile functionfile'
	exit
fi;

indent=""
indent_inter="    "
right="--->"
left="<---"
indent_num=0
space=0
base_addr=0x55699a337000
cat $2 | while read line
do
	if [ "$line" = 'Enter' ]; then
		read line1
		read line2
		line1=$[line1-base]
		line2=$[line2-base]
		echo $line1
		echo $line2
		addr2line -e $1 -f $line1 -s | sed 's/^/'"$indent"'/' >> $3
		echo $right | sed 's/^/'"$indent"'/' >> $3
		indent="${indent}${indent_inter}"
		indent_num=$[indent_num+1]
		echo "enter-indent_num:$indent_num"
		addr2line -e $1 -f $line2 -s | sed 's/^/'"$indent"'/' >> $3
		echo >> $3
	elif [ "$line" = 'Exit' ]; then
		read line1
		read line2
		line1=$[line1-base]
		line2=$[line2-base]
		addr2line -e $1 -f $line2 -s | sed 's/^/'"$indent"'/' >> $3
		echo $left | sed 's/^/'"$indent"'/' >> $3
		indent_num=$[indent_num-1]
		echo "exit-indent_num:$indent_num"
		space=$[indent_num*4]
		indent=${indent:0:$space}
		addr2line -e $1 -f $line1 -s | sed 's/^/'"$indent"'/' >> $3
		echo >> $3
	fi;
done

