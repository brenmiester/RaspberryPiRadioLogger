#!/bin/sh

#Creates Time and Date variables in correct timezone and format
timecode=$(TZ="###TIMEZONE OF BROADCAST###" date +%Y%m%d_%H:%M)
date=$(date +%Y_%m_%d)

#Output directory
output_dir=###OUTPUT DIR###%date

if [ ! -d $output_dir ]; then
mkdir $output_dir
fi

#URL and output filename
#Needs direct URL, can be found via network logs
url=###STREAM URL###
output_filename=###CALLSIGN###_$timecode

#Duration in Seconds
duration=###DURATION###

cd $output_dir

streamripper $url -d $output_dir -l $duration -a $output_filename -o always

#Moves Meta Files
if [ ! -d Meta ]; then
mkdir Meta
fi

mv *.cue $output_dir/Meta
