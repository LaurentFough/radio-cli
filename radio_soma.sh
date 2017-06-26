#!/usr/local/bin/bash

## ref: [github/cirrusUK](https://gist.github.com/cirrusUK/85970fc9b7127eda0107e38a3bd95a08)

red=`tput setaf 1`
tput setaf 1
# echo '
#
#                   | _)
#      _| _` |   _` |  |   _ \
#    _| \__,_| \__,_| _| \___/
#                            '
# http://www.kammerl.de/ascii/AsciiSignature.php
# styles: caligraphy, calgphy2, swampland, isometric3, isometric4, 3d, roman, broadway
echo '
                          ##                              #######          # ###        #####   ##    ##         ##
                           ##    #                      /       ###      /  /###     ######  /#### #####      /####
                           ##   ###                    /         ##     /  /  ###   /#   /  /  ##### #####   /  ###
                           ##    #                     ##        #     /  ##   ### /    /  /   # ##  # ##       /##
                           ##                           ###           /  ###    ###    /  /    #     #         /  ##
###  /###     /###     ### ##  ###       /###          ## ###        ##   ##     ##   ## ##    #     #         /  ##
 ###/ #### / / ###  / ######### ###     / ###  /        ### ###      ##   ##     ##   ## ##    #     #        /    ##
  ##   ###/ /   ###/ ##   ####   ##    /   ###/           ### ###    ##   ##     ##   ## ##    #     #        /    ##
  ##       ##    ##  ##    ##    ##   ##    ##              ### /##  ##   ##     ##   ## ##    #     #       /      ##
  ##       ##    ##  ##    ##    ##   ##    ##                #/ /## ##   ##     ##   ## ##    #     ##      /########
  ##       ##    ##  ##    ##    ##   ##    ##                 #/ ##  ##  ##     ##   #  ##    #     ##     /        ##
  ##       ##    ##  ##    ##    ##   ##    ##                  # /    ## #      /       /     #      ##    #        ##
  ##       ##    /#  ##    /#    ##   ##    ##        /##        /      ###     /    /##/      #      ##   /####      ##
  ###       ####/ ##  ####/      ### / ######        /  ########/        ######/    /  #####           ## /   ####    ## /
   ###       ###   ##  ###        ##/   ####        /     #####            ###     /     ##              /     ##      #/
                                                    |                              #                     #
                                                     \)                             ##                    ##
'

stations=(
SF1033="http://ice1.somafm.com/sf1033-128-mp3"
Lush="http://ice1.somafm.com/lush-128-mp3"
Defcon="http://ice1.somafm.com/defcon-128-mp3"
GrooveSalad="http://ice1.somafm.com/groovesalad-128-mp3"
DroneZone="http://ice1.somafm.com/dronezone-128-mp3"
Fluid="http://ice1.somafm.com/fluid-128-mp3"
DeepSpace="http://ice1.somafm.com/deepspaceone-128-mp3"
SecretAgent="http://ice1.somafm.com/secretagent-128-mp3"
CirrusMPD="http://cirrus.turtil.net:9001"
Dubstep="http://67.212.233.124:8014"
Hardcore="http://67.212.233.124:8002"
PinkFloyd="http://99.198.112.59:8000"
)

# show_inf () {
#   sed -n '/Name/,/Bitrate/ p' $tfile
#   }

while(true); do
  index=0
  echo
  for i in "${stations[@]}"; do
    echo ${ser}$index.${norm} ${name}${i%%=*}${norm}
    index=$[index+1]
  done

  echo
  read -p "${blue}Station:${norm} " sta
  echo

  capture="-capture -dumpfile ${stations[$sta]%%=*}_`date "+%T_%F"`.mp3"

# tfile=`mktemp`

  radio_soma_player="${1}"

  case $radio_soma_player in
    mpv|MPV)
      radio_soma_player="$1|$(which mpv)"
      echo -ne "${cyan}\n[radio_soma] Chosen Player: $radio_soma_player ${norm}"
      $(which mpv) --no-video `echo ${stations[$sta]} | cut -d '=' -f2`
      ;;

    mps|MPS|mplayershell|MPLAYERSHELL)
      radio_soma_player="$1|$(which mps)"
      echo -ne "${cyan}\n[radio_soma] Chosen Player: $radio_soma_player ${norm}"
      $(which mps) -vc null -nolirc -msglevel all=4 ${capture} -msgcolor `echo ${stations[$sta]} | cut -d '=' -f2`
      ;;

    mplayer|MPLAYER|mplayer2|MPLAYER2)
      radio_soma_player="$1|$(which mplayer)"
      echo -ne "${cyan}\n[radio_soma] Chosen Player: $radio_soma_player ${norm}"
      $(which mplayer) -vc null -vo null -nolirc -msglevel all=4 ${capture} -msgcolor `echo ${stations[$sta]} | cut -d '=' -f2`
      ;;

    ""|" ")
      radio_soma_player="[null]|$(which mplayer)"
      echo -ne "${cyan}\n[radio_soma] Chosen Player: $radio_soma_player ${norm}"
      $(which mplayer) -vc null -vo null -nolirc -msglevel all=4 ${capture} -msgcolor `echo ${stations[$sta]} | cut -d '=' -f2`
      ;;

    *)
      # default
      radio_soma_player="$1|$(which mplayer)"
      echo -ne "${cyan}\n[radio_soma] Chosen Player: $radio_soma_player ${norm}"
      $(which mplayer) -vc null -vo null -nolirc -msglevel all=4 ${capture} -msgcolor `echo ${stations[$sta]} | cut -d '=' -f2`
      ;;
  esac

  echo -ne "${cyan}\n[radio_soma] Press Enter to change station ${norm}"
  read -t 5
  [[ $? -gt 128 ]] && { echo && exit 0; }
# rm $tfile
  unset -v index sta capture
done

exit 0