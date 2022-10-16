#!/bin/bash

if [ -e ${HOME}/var/lock/pipewire-volume.lock ]; then
	echo "pipewire-volume.lock exists"
	exit
fi

touch ${HOME}/var/lock/pipewire-volume.lock
new_volume=$1

pactl list sinks | grep "Name: " | cut -c8- | while read sink; do

	echo "Sink ${sink}"
	echo "========"

	current_volume=$(pactl list sinks |
			awk '/^\s+Name: /{matched = $2 == "'${sink}'"}
				/^\s+Volume: / && matched {print $7; exit}')

	if [[ "${new_volume:0:1}" == "m" ]]; then
		pactl set-sink-mute ${sink} toggle

	elif [[ "${new_volume:0:1}" == "-" ]]; then
		echo "Current volume: ${current_volume}. Decreasing by ${new_volume}dB"
		pactl set-sink-volume ${sink} ${new_volume}dB
	else
		if [[ "${new_volume:0:1}" == "+" ]]; then
			if [[ "${current_volume}" == "-inf" ]]; then
				pactl set-sink-volume ${sink} 1%

			elif (( $(echo "${current_volume} ${new_volume} > 0" | bc -l ) )); then
				echo "Current volume: ${current_volume}. Attempted to increase by ${new_volume}dB but the volume is capped at 0dB"
				pactl set-sink-volume ${sink} 0dB
			else
				echo "Current volume: ${current_volume}. Increasing by ${new_volume}dB"
				pactl set-sink-volume ${sink} ${new_volume}dB
			fi
		else
			if (( $(echo "${new_volume} > 0" | bc -l ) )); then
				echo "Current volume: ${current_volume}. Attempted to set volume to ${new_volume}dB but the volume is capped at 0dB"
				pactl set-sink-volume ${sink} 0dB
			else
				echo "Current volume: ${current_volume}. Setting volume to ${new_volume}dB"
				pactl set-sink-volume ${sink} ${new_volume}dB
			fi
		fi
	fi
done

rm ${HOME}/var/lock/pipewire-volume.lock

