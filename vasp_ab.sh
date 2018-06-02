#!/bin/bash
# Copyright (c) 2018 M. Farzalipour Tabriz
# Copyrights licensed under the GNU Lesser General Public License v3 (LGPL-3.0)
# See the accompanying LICENSE file for terms.

#if there is going to be more options, they should go here!
while [[ $1 = -* ]]; do
	arg=$1; shift           # shift the found arg away
	case $arg in
		--help)
		printf "Usage: vasp_ab.sh [OUTCAR_file] [AB_file]\n";
		printf "This script reads the final Kohn-Sham eigenvalues, and Kohn-Sham orbitals' occupation of each spin channel from the OUTCAR file of a spin-polarized VASP calculation and writes them into a single text file side by side for all the k-points.\n\n";
		printf "[OUTCAR_file] =	VASP OUTCAR file. Default: \"OUTCAR.gz\" or \"OUTCAR\"\n";
		printf "[AB_file] = 	Output txt file. Default: {OUTCAR_file}.AB\n";
		exit 1
		;;
	esac
done

input_file=$1;
output_file=$2;


#if input_file is not provided
if [ -z "$input_file" ]; then
	if [ -f OUTCAR.gz ]; then
		input_file="OUTCAR.gz";
	elif [ -f OUTCAR ]; then
		input_file="OUTCAR";
	fi
fi

#if output is not provided
if [ -z "$output_file" ]; then
	output_file=${input_file%.gz}.AB;
fi

if [[ $input_file == *".gz" ]]; then
	catcher="zgrep"
	streamer="gunzip -c"
else
	catcher="grep"
	streamer="less"
fi


if [ -f "$input_file" ]; then
	s1=$($catcher -n "spin component 1" $input_file| tail -1|cut -d':' -f1);
	s2=$($catcher -n "spin component 2" $input_file| tail -1|cut -d':' -f1);
	end=$(($s2*2-$s1));
	len=$(($s2-$s1));
	paste <($streamer $input_file | head -n $(($s2-1)) | tail -n $len;) <($streamer $input_file | head -n $end | tail -n $(($len+1));) > "$output_file"
else
	echo "Requested OUTCAR file ($input_file) could not be found!";
fi
 
