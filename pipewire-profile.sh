#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Usage: $0 <speaker/headphone>"
	exit
fi

set -x
sink=""

if [ "$1" == "speaker" ]; then
	sink="alsa_output.pci-0000_00_1f.3.analog-stereo"

elif [ "$1" == "headphone" ]; then
    #sink="alsa_output.usb-Focusrite_Scarlett_Solo_USB_Y779MMY9717E74-00.iec958-stereo"
	sink="alsa_output.usb-Focusrite_Scarlett_Solo_USB_Y779MMY9717E74-00.pro-output-0"

else
	exit
fi

pactl list sink-inputs | grep "Sink Input" | cut -c13- | while read sink_input; do
		pactl move-sink-input $sink_input $sink
	done

pactl set-default-sink $sink

