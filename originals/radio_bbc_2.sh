#!/bin/bash

# ref:original: play
# ref: https://github.com/stengland, https://gist.github.com/stengland/4052479

#!/bin/bash
play() {
  playlist="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_$1.m3u8"
  echo $playlist
  if mpc
  then
    mpc add $playlist
    mpc play
  else
    mplayer $playlist
  fi
}
if [ -z "$1" ]; then
  echo "Select a station:"
  select s in radio_one radio_two radio_three radio_fourfm radio_five_live 6music
  do
    play ${s##* }
    break
  done
else
  play $1
fi
# GistID: 4052479