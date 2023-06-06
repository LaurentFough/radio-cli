#!/usr/local/bin/bash

red=`tput setaf 1`
tput setaf 1
# echo '
#
#                   | _)
#      _| _` |   _` |  |   _ \
#    _| \__,_| \__,_| _| \___/
#                            '
# http://www.kammerl.de/ascii/AsciiSignature.php
# styles: caligraphy, calgphy2, swampland, [y]isometric1, isometric3, isometric4, 3d, roman, broadway
echo '  ___           ___           ___                       ___                    ___           ___           ___           ___
     /\  \         /\  \         /\  \          ___        /\  \                  /\__\         /\__\         |\__\         /\  \
    /::\  \       /::\  \       /::\  \        /\  \      /::\  \                /:/ _/_       /::|  |        |:|  |       /::\  \
   /:/\:\  \     /:/\:\  \     /:/\:\  \       \:\  \    /:/\:\  \              /:/ /\__\     /:|:|  |        |:|  |      /:/\:\  \
  /::\~\:\  \   /::\~\:\  \   /:/  \:\__\      /::\__\  /:/  \:\  \            /:/ /:/ _/_   /:/|:|  |__      |:|__|__   /:/  \:\  \
 /:/\:\ \:\__\ /:/\:\ \:\__\ /:/__/ \:|__|  __/:/\/__/ /:/__/ \:\__\          /:/_/:/ /\__\ /:/ |:| /\__\     /::::\__\ /:/__/ \:\__\
 \/_|::\/:/  / \/__\:\/:/  / \:\  \ /:/  / /\/:/  /    \:\  \ /:/  /          \:\/:/ /:/  / \/__|:|/:/  /    /:/~~/~    \:\  \  \/__/
    |:|::/  /       \::/  /   \:\  /:/  /  \::/__/      \:\  /:/  /            \::/_/:/  /      |:/:/  /    /:/  /       \:\  \
    |:|\/__/        /:/  /     \:\/:/  /    \:\__\       \:\/:/  /              \:\/:/  /       |::/  /     \/__/         \:\  \
    |:|  |         /:/  /       \::/__/      \/__/        \::/  /                \::/  /        /:/  /                     \:\__\
     \|__|         \/__/         ~~                        \/__/                  \/__/         \/__/                       \/__/
'


wnyc_stations=(
"[WNYC] 93.9 FM"="http://www.wnyc.org/stream/wnyc-fm939/aac.pls"
"[WNYC] 820 AM Xtra"="http://www.wnyc.org/stream/wnyc-am820/aac.pls"
"[WNYC] WQXR 105.9 FM"="http://www.wnyc.org/stream/wqxr/aac.pls"
"[WNYC] Q2 Music"="http://www.wnyc.org/stream/q2/aac.pls"
"[WNYC] Operavore"="http://www.wqxr.org/stream/wqxr-special/aac.pls"
"[WNYC] NJPR"="http://www.wnyc.org/stream/njpr/mp3.pls"
"[WNYC] The Jonathan Channel"="http://www.wnyc.org/stream/jonathan-channel/aac.pls"
)


while(true); do
  index=0
  echo
  for i in "${wnyc_stations[@]}"; do
    echo ${ser}$index.${norm} ${name}${i%%=*}${norm}
    index=$[index+1]
  done

  echo
  read -p "${blue}WNYC Station:${norm} " station
  echo

  capture="-capture -dumpfile ${wnyc_stations[$station]%%=*}_`date "+%T_%F"`.mp3"

  radio_wnyc_player="${1,yy}" # convert argument to lower-case; bash >4
  # radio_wnyc_player="(echo $1 | tr '[:upper:]' '[:lower:]')" # convert argument to lower-case; bash <4
  # radio_wnyc_player="$(echo $1 | awk '{print tolower($0)}')" # convert argument to lower-case; awk

  case $radio_wnyc_player in
    mpv)
      radio_wnyc_player="$1|$(which mpv)"
      echo -ne "${cyan}\n[radio_wnyc] Chosen Player: $radio_wnyc_player ${norm}"
      $(which mpv) --no-video `echo ${wnyc_stations[$station]} | cut -d '=' -f2`
      ;;

    mps|mplayershell)
      radio_wnyc_player="$1|$(which mps)"
      echo -ne "${cyan}\n[radio_wnyc] Chosen Player: $radio_wnyc_player ${norm}"
      $(which mps) -vc null -nolirc -msglevel all=4 ${capture} -msgcolor `echo ${wnyc_stations[$station]} | cut -d '=' -f2`
      ;;

    mplayer|mplayer2)
      radio_wnyc_player="$1|$(which mplayer)"
      echo -ne "${cyan}\n[radio_wnyc] Chosen Player: $radio_wnyc_player ${norm}"
      $(which mplayer) -vc null -vo null -nolirc -msglevel all=4 -msgcolor -quiet -playlist `echo ${wnyc_stations[$station]} | cut -d '=' -f2`
      ;;

    ""|" ")
      radio_wnyc_player="[null]|$(which mplayer)"
      echo -ne "${cyan}\n[radio_wnyc] Chosen Player: $radio_wnyc_player ${norm}"
      $(which mplayer) -vc null -vo null -nolirc -msglevel all=4 -msgcolor -quiet -playlist `echo ${wnyc_stations[$station]} | cut -d '=' -f2`
      ;;

    *)
      # default
      radio_wnyc_player="$1|$(which mplayer)"
      echo -ne "${cyan}\n[radio_wnyc] Chosen Player: $radio_wnyc_player ${norm}"
      $(which mplayer) -vc null -vo null -nolirc -msglevel all=4 -msgcolor -quiet -playlist `echo ${wnyc_stations[$station]} | cut -d '=' -f2`
      ;;
  esac

echo -ne "${cyan}\n[radio_wnyc] Press Enter to change station ${norm}"
  read -t 5
  [[ $? -gt 128 ]] && { echo && exit 0; }
# rm $tfile
  unset -v index station capture
done

exit 0
