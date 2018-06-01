#!/bin/bash
# Copyright (c) 2018 M. Farzalipour Tabriz
# Copyrights licensed under the GNU Lesser General Public License v3 (LGPL-3.0)
# See the accompanying LICENSE file for terms.

filename=$1;
output=$2;
#if there is going to  be more options, they go here!
while [[ $1 = -* ]]; do
	arg=$1; shift           # shift the found arg away
	case $arg in
		--help)
		echo "Usage: vasp_ab.sh [OUTCAR_file] [AB_file]";
		echo "This script reads OUTCAR file of a spin polarized VASP calculation and writes energy levels and occupation numbers of each spin channel side by side to a text file.";
		echo "Default: OUTCAR_file = \"OUTCAR.gz\" or \"OUTCAR\"";
		echo "Default: AB_file = {OUTCAR_file}.AB"
		exit 1
		;;
	esac
done

#if filename is not provided
if [ -z "$filename" ]; then
	if [ -f OUTCAR.gz ]; then
		filename="OUTCAR.gz";
	elif [ -f OUTCAR ]; then
		filename="OUTCAR";
	fi
fi

#if output is not provided
if [ -z "$output" ]; then
	output=${filename%.gz}.AB;
fi


if [ -f "$filename" ]; then
	if [[ $filename == *".gz" ]]; then
		s1=$(zgrep -n "spin component 1" $filename| tail -1|cut -d':' -f1);
		s2=$(zgrep -n "spin component 2" $filename| tail -1|cut -d':' -f1);
		end=$(($s2*2-$s1));
		len=$(($s2-$s1));
		paste <(gunzip -c $filename | head -n $(($s2-1)) | tail -n $len;) <(gunzip -c $filename | head -n $end | tail -n $(($len+1));) > "$output"
	else
		s1=$(grep -n "spin component 1" $filename| tail -1|cut -d':' -f1);
		s2=$(grep -n "spin component 2" $filename| tail -1|cut -d':' -f1);
		end=$(($s2*2-$s1));
		len=$(($s2-$s1));
		paste <(less $filename | head -n $(($s2-1)) | tail -n $len;) <(less $filename | head -n $end | tail -n $(($len+1));) > "$output"
	fi
else
	echo "Requested OUTCAR file ($filename) could not be found!";
fi
 
