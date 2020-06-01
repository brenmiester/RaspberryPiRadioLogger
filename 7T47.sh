#!/bin/sh

date='%d'

# URL of Icecast/Shoutcast stream
url=https://stream.lava.net.au/au_tas_7T47_pulsefm
output_filename=7T47_${date}

# Length in Seconds
duration=600

#Output Directory
output_dir=/home/pi/FTP/logger/7T47_PulseFM

cd $output_dir

streamripper $url -d $output_dir -l $duration -a $output_filename -o always

mv *.cue Meta
