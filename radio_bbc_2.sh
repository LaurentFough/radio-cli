#!/bin/bash

# ref:original: play
# ref: https://github.com/stengland, https://gist.github.com/stengland/4052479

play_bbc () {
  playlist_bbc="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_$1.m3u8"

  echo $playlist

  if mpc
  then
    mpc add $playlist_bbc
    mpc play
  else
    mplayer $playlist
  fi
}

if [ -z "$1" ]; then
  echo "[radio_bbc/2]Select a station:"
    select s in radio_one radio_two radio_three radio_fourfm radio_five_live 6music
  do
    play_bbc ${s##* }
    break
  done
else
  play_bbc $1
fi