#!/usr/bin/env bash

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
echo '                   ___           ___           ___     
        ___        /  /\         /__/\         /__/\    24
      /__/\      /  /::\        \  \:\        \  \:\   
      \__\:\    /  /:/\:\        \  \:\        \  \:\  
  ___ /  /::\  /  /::\ \:\        \  \:\        \  \:\ 
  /__/\  /:/\/ /__/:/\:\_\:\  ______\__\:\  ______\__\:\
  \  \:\/:/~~  \__\/  \:\/:/ \  \::::::::/ \  \::::::::/
  \  \::/          \__\::/   \  \:\~~~~~   \  \:\~~~~~ 
    \__\/           /  /:/     \  \:\        \  \:\     
                  /__/:/       \  \:\        \  \:\    
                  \__\/         \__\/         \__\/    
'


jazz24_stations=(
 "[JAZZ24] 48K AAC"="https://live.wostreaming.net/playlist/ppm-jazz24aac48-ibc1.m3u"
 "[JAZZ24] 64K AAC"="https://live.wostreaming.net/playlist/ppm-jazz24aac-ibc1.m3u"
 "[JAZZ24] 256k AAC"="https://live.wostreaming.net/playlist/ppm-jazz24aac256-ibc1.m3u"
 "[JAZZ24] 128k MP3"="https://live.wostreaming.net/playlist/ppm-jazz24mp3-ibc1.m3u"
)


while(true); do
  index=0
  echo
  for i in "${jazz24_stations[@]}"; do
    echo ${ser}$index.${norm} ${name}${i%%=*}${norm}
    index=$[index+1]
  done

  echo
  read -p "${blue}JAZZ24 Station:${norm} " station
  echo

  capture="-capture -dumpfile ${jazz24_stations[$station]%%=*}_`date "+%T_%F"`.mp3"

  radio_jazz24_player="${1,yy}" # convert argument to lower-case; bash >4
  # radio_jazz24_player="(echo $1 | tr '[:upper:]' '[:lower:]')" # convert argument to lower-case; bash <4
  # radio_jazz24_player="$(echo $1 | awk '{print tolower($0)}')" # convert argument to lower-case; awk

  case $radio_jazz24_player in
    mpv)
      radio_jazz24_player="$1|$(which mpv)"
      echo -ne "${cyan}\n[radio_jazz24] Chosen Player: $radio_jazz24_player ${norm}"
      $(which mpv) --no-video `echo ${jazz24_stations[$station]} | cut -d '=' -f2`
      ;;

    mps|mplayershell)
      radio_jazz24_player="$1|$(which mps)"
      echo -ne "${cyan}\n[radio_jazz24] Chosen Player: $radio_jazz24_player ${norm}"
      $(which mps) -vc null -nolirc -msglevel all=4 ${capture} -msgcolor `echo ${jazz24_stations[$station]} | cut -d '=' -f2`
      ;;

    mplayer|mplayer2)
      radio_jazz24_player="$1|$(which mplayer)"
      echo -ne "${cyan}\n[radio_jazz24] Chosen Player: $radio_jazz24_player ${norm}"
      $(which mplayer) -vc null -vo null -nolirc -msglevel all=4 -msgcolor -quiet -playlist `echo ${jazz24_stations[$station]} | cut -d '=' -f2`
      ;;

    ""|" ")
      radio_jazz24_player="[null]|$(which mplayer)"
      echo -ne "${cyan}\n[radio_jazz24] Chosen Player: $radio_jazz24_player ${norm}"
      $(which mplayer) -vc null -vo null -nolirc -msglevel all=4 -msgcolor -quiet -playlist `echo ${jazz24_stations[$station]} | cut -d '=' -f2`
      ;;

    *)
      # default
      radio_jazz24_player="$1|$(which mplayer)"
      echo -ne "${cyan}\n[radio_jazz24] Chosen Player: $radio_jazz24_player ${norm}"
      $(which mplayer) -vc null -vo null -nolirc -msglevel all=4 -msgcolor -quiet -playlist `echo ${jazz24_stations[$station]} | cut -d '=' -f2`
      ;;
  esac

echo -ne "${cyan}\n[radio_jazz24] Press Enter to change station ${norm}"
  read -t 5
  [[ $? -gt 128 ]] && { echo && exit 0; }
# rm $tfile
  unset -v index station capture
done

exit 0