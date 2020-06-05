#!/bin/sh

#Creates Time and Date variables in correct timezone and format
timecode=$(TZ="Australia/Hobart" date +%Y%m%d_%H:%M)
date=$(date +%Y_%m_%d)

#Output directory
output_dir=/home/pi/FTP/logger/7T47_PulseFM/$date

if [ ! -d $output_dir ]; then
mkdir $output_dir
fi

#URL and output filename
url=https://stream.lava.net.au/au_tas_7T47_pulsefm
output_filename=7T47_$timecode

#Duration in Seconds
duration=600

cd $output_dir

streamripper $url -d $output_dir -l $duration -a $output_filename -o always

#Moves Meta Files
if [ ! -d Meta ]; then
mkdir Meta
fi

mv *.cue $output_dir/Meta
