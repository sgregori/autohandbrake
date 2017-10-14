#!/bin/bash
load_folder="DOWNLOADS"
save_folder="COMPRESSED"
options=" --audio-copy-mask aac,ac3,dtshd,dts,mp3 --cfr --encoder x264 --vb 1500 --aencoder faac --ab 160 --mixdown stereo --arate auto --audio 1,2 --drc 0 --gain 0 --aq -1 --format mkv --crop autocrop --denoise 0 --width 1280 --encopts ref=1:weightp=1:subq=2:rc-lookahead=10:trellis=0:8x8dct=0:threads=2 --turbo --custom-anamorphic --keep-display-aspect "

for entry in $load_folder/*.mkv
do
    if [ ! -f "$save_folder/$entry" ];then
        echo "Processing: $entry"  
	nice -n19 HandBrakeCLI $options -i "$load_folder/$entry" -o "$save_folder/$entry"
    fi
done
