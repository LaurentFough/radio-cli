#!/usr/local/bin/bash

# original: somafm
# ref:source: http://www.commandlinefu.com/commands/view/2080/plays-music-from-somafm

function somafm () {

	local station;

	echo "Select a station to listen to:";
	select station in "Doomed" \
					"Groove Salad" \
					"Lush" \
					"Suburbs of Goa" \
					"Secret Agent" \
					"Drone Zone" \
					"Space Station" \
					"cliqhop idm" \
					"Digitalis" \
					"Sonic Universe" \
					"Boot Liquor" \
					"Covers" \
					"Illinois Street Lounge" \
					"indie pop rocks" \
					"PopTron" \
					"Tags Trip" \
					"Beat Bender" \
					"Mission Control";

	do station=$(echo -n "$station"|tr '[:upper:]' '[:lower:]'| sed 's/ //g');
		break;
	done;

	mplayer -vo none -ao sdl http://somafm.com/startstream=${station}.pls;}