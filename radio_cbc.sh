#!/usr/local/bin/bash

function assertInstalled() {
    for var in "$@"; do
        if ! which $var &> /dev/null; then
            echo "[radio_cbc] Selected player not available. Please Install $var!"
            exit 1
        fi
    done
}

red=`tput setaf 1`
tput setaf 1
# echo '
#
#                   | _)
#      _| _` |   _` |  |   _ \
#    _| \__,_| \__,_| _| \___/
#                            '
# http://www.kammerl.de/ascii/AsciiSignature.php
# styles-that-we-like: caligraphy, calgphy2, swampland, [y]isometric1, isometric3, isometric4, 3d, roman, broadway
echo '      ___           ___           ___                       ___                    ___           ___           ___
     /\  \         /\  \         /\  \          ___        /\  \                  /\  \         /\  \         /\  \
    /::\  \       /::\  \       /::\  \        /\  \      /::\  \                /::\  \       /::\  \       /::\  \
   /:/\:\  \     /:/\:\  \     /:/\:\  \       \:\  \    /:/\:\  \              /:/\:\  \     /:/\:\  \     /:/\:\  \
  /::\~\:\  \   /::\~\:\  \   /:/  \:\__\      /::\__\  /:/  \:\  \            /:/  \:\  \   /::\~\:\__\   /:/  \:\  \
 /:/\:\ \:\__\ /:/\:\ \:\__\ /:/__/ \:|__|  __/:/\/__/ /:/__/ \:\__\          /:/__/ \:\__\ /:/\:\ \:|__| /:/__/ \:\__\
 \/_|::\/:/  / \/__\:\/:/  / \:\  \ /:/  / /\/:/  /    \:\  \ /:/  /          \:\  \  \/__/ \:\~\:\/:/  / \:\  \  \/__/
    |:|::/  /       \::/  /   \:\  /:/  /  \::/__/      \:\  /:/  /            \:\  \        \:\ \::/  /   \:\  \
    |:|\/__/        /:/  /     \:\/:/  /    \:\__\       \:\/:/  /              \:\  \        \:\/:/  /     \:\  \
    |:|  |         /:/  /       \::/__/      \/__/        \::/  /                \:\__\        \::/__/       \:\__\
     \|__|         \/__/         ~~                        \/__/                  \/__/         ~~            \/__/
'


cbc_stations=(
"[CBC] Kamloops"="http://cbc_r1_kam.akacast.akamaistream.net/7/440/451661/v1/rc.akacast.akamaistream.net/cbc_r1_kam"
"[CBC] Kelowna"="http://cbc_r1_kel.akacast.akamaistream.net/7/229/451661/v1/rc.akacast.akamaistream.net/cbc_r1_kel"
"[CBC] Prince George"="http://cbc_r1_prg.akacast.akamaistream.net/7/966/451661/v1/rc.akacast.akamaistream.net/cbc_r1_prg"
"[CBC] Vancouver"="http://cbc_r1_vcr.akacast.akamaistream.net/7/723/451661/v1/rc.akacast.akamaistream.net/cbc_r1_vcr"
"[CBC] Victoria"="http://cbc_r1_vic.akacast.akamaistream.net/7/728/451661/v1/rc.akacast.akamaistream.net/cbc_r1_vic"
"[CBC] Yukon - Whitehorse"="http://cbc_r1_whs.akacast.akamaistream.net/7/319/451661/v1/rc.akacast.akamaistream.net/cbc_r1_whs"
"[CBC] Alberta - Calgary"="http://cbc_r1_cgy.akacast.akamaistream.net/7/298/451661/v1/rc.akacast.akamaistream.net/cbc_r1_cgy"
"[CBC] Edmonton"="http://cbc_r1_edm.akacast.akamaistream.net/7/904/451661/v1/rc.akacast.akamaistream.net/cbc_r1_edm"
"[CBC] Saskatchewan - Regina"="http://cbc_r1_reg.akacast.akamaistream.net/7/666/451661/v1/rc.akacast.akamaistream.net/cbc_r1_reg"
"[CBC] Saskatoon"="http://cbc_r1_ssk.akacast.akamaistream.net/7/842/451661/v1/rc.akacast.akamaistream.net/cbc_r1_ssk"
"[CBC] Manitoba - Winnipeg"="http://cbc_r1_wpg.akacast.akamaistream.net/7/831/451661/v1/rc.akacast.akamaistream.net/cbc_r1_wpg"
"[CBC] Nunavut - Iqaluit"="http://cbc_r1_iqa.akacast.akamaistream.net/7/325/451661/v1/rc.akacast.akamaistream.net/cbc_r1_iqa"
"[CBC] Ontario - Kitchener:Waterloo"="http://cbc_r1_ekw.akacast.akamaistream.net/7/63/451661/v1/rc.akacast.akamaistream.net/cbc_r1_ekw"
"[CBC] London"="http://cbc_r1_ldn.akacast.akamaistream.net/7/104/451661/v1/rc.akacast.akamaistream.net/cbc_r1_ldn"
"[CBC] Ottawa"="http://cbc_r1_ott.akacast.akamaistream.net/7/613/451661/v1/rc.akacast.akamaistream.net/cbc_r1_ott"
"[CBC] Sudbury"="http://cbc_r1_sud.akacast.akamaistream.net/7/380/451661/v1/rc.akacast.akamaistream.net/cbc_r1_sud"
"[CBC] Thunder Bay"="http://cbc_r1_tba.akacast.akamaistream.net/7/245/451661/v1/rc.akacast.akamaistream.net/cbc_r1_tba"
"[CBC] Toronto"="http://cbc_r1_tor.akacast.akamaistream.net/7/632/451661/v1/rc.akacast.akamaistream.net/cbc_r1_tor"
"[CBC] Windsor"="http://cbc_r1_wdr.akacast.akamaistream.net/7/813/451661/v1/rc.akacast.akamaistream.net/cbc_r1_wdr"
"[CBC] Quebec - Montreal"="http://cbc_r1_mtl.akacast.akamaistream.net/7/35/451661/v1/rc.akacast.akamaistream.net/cbc_r1_mtl"
"[CBC] Nord Quebec"="http://cbc_r1_n_mtl.akacast.akamaistream.net/7/823/451661/v1/rc.akacast.akamaistream.net/cbc_r1_n_mtl"
"[CBC] Quebec City"="http://cbc_r1_qqu.akacast.akamaistream.net/7/29/451661/v1/rc.akacast.akamaistream.net/cbc_r1_qqu"
"[CBC] New Brunswick - Fredericton"="http://cbc_r1_frd.akacast.akamaistream.net/7/553/451661/v1/rc.akacast.akamaistream.net/cbc_r1_frd"
"[CBC] Moncton"="http://cbc_r1_mct.akacast.akamaistream.net/7/383/451661/v1/rc.akacast.akamaistream.net/cbc_r1_mct"
"[CBC] Saint John"="http://cbc_r1_snb.akacast.akamaistream.net/7/754/451661/v1/rc.akacast.akamaistream.net/cbc_r1_snb"
"[CBC] Prince Edward Island - Charlottetown"="http://cbc_r1_chr.akacast.akamaistream.net/7/169/451661/v1/rc.akacast.akamaistream.net/cbc_r1_chr"
"[CBC] Nova Scotia - Cape Breton"="http://cbc_r1_syd.akacast.akamaistream.net/7/897/451661/v1/rc.akacast.akamaistream.net/cbc_r1_syd"
"[CBC] Halifax"="http://cbc_r1_hfx.akacast.akamaistream.net/7/981/451661/v1/rc.akacast.akamaistream.net/cbc_r1_hfx"
"[CBC] Newfoundland:Labrador - Corner Brook"="http://cbc_r1_cor.akacast.akamaistream.net/7/550/451661/v1/rc.akacast.akamaistream.net/cbc_r1_cor"
"[CBC] Grand Falls - Gander"="http://cbc_r1_gfa.akacast.akamaistream.net/7/492/451661/v1/rc.akacast.akamaistream.net/cbc_r1_gfa"
"[CBC] Labrador"="http://cbc_r1_gba.akacast.akamaistream.net/7/274/451661/v1/rc.akacast.akamaistream.net/cbc_r1_gba"
"[CBC] St. Johns"="http://cbc_r1_snf.akacast.akamaistream.net/7/750/451661/v1/rc.akacast.akamaistream.net/cbc_r1_snf"
"[CBC] Northwest Territories - Inuvik"="http://cbc_r1_ink.akacast.akamaistream.net/7/967/451661/v1/rc.akacast.akamaistream.net/cbc_r1_ink"
"[CBC] Yellowknife"="http://cbc_r1_ykn.akacast.akamaistream.net/7/369/451661/v1/rc.akacast.akamaistream.net/cbc_r1_ykn"
"[CBC] Atlantic-Halifax"="http://cbc_r2_hfx.akacast.akamaistream.net/7/917/451661/v1/rc.akacast.akamaistream.net/cbc_r2_hfx"
"[CBC] Eastern-Toronto"="http://cbc_r2_tor.akacast.akamaistream.net/7/364/451661/v1/rc.akacast.akamaistream.net/cbc_r2_tor"
"[CBC] Central-Winnipeg"="http://cbc_r2_wpg.akacast.akamaistream.net/7/233/451661/v1/rc.akacast.akamaistream.net/cbc_r2_wpg"
"[CBC] Mountain-Edmonton"="http://cbc_r2_edm.akacast.akamaistream.net/7/40/451661/v1/rc.akacast.akamaistream.net/cbc_r2_edm"
"[CBC] Pacific-Vancouver"="http://cbc_r2_vcr.akacast.akamaistream.net/7/773/451661/v1/rc.akacast.akamaistream.net/cbc_r2_vcr"
"[CBC] International-Pacific"="http://cbc_r2_ipt.akacast.akamaistream.net/7/669/451661/v1/rc.akacast.akamaistream.net/cbc_r2_ipt"
"[CBC] International-Eastern"="http://cbc_r2_iet.akacast.akamaistream.net/7/50/451661/v1/rc.akacast.akamaistream.net/cbc_r2_iet"
)


while(true); do
  index=0
  echo
  for i in "${cbc_stations[@]}"; do
    echo ${ser}$index.${norm} ${name}${i%%=*}${norm}
    index=$[index+1]
  done

  echo
  read -p "${blue}CBC Station:${norm} " station
  echo

  radio_capture="-capture -dumpfile ${cbc_stations[$station]%%=*}_`date "+%T_%F"`.mp3"

  radio_cbc_player="${1,yy}" # convert argument to lower-case; bash >4
  # radio_cbc_player="(echo $1 | tr '[:upper:]' '[:lower:]')" # convert argument to lower-case; bash <4
  # radio_cbc_player="$(echo $1 | awk '{print tolower($0)}')" # convert argument to lower-case; awk

  case $radio_cbc_player in
    mpv)
      radio_cbc_player="$1|$(which mpv)"
      echo -ne "${cyan}\n[radio_cbc] Chosen Player: $radio_cbc_player ${norm}"
      $(which mpv) --no-video `echo ${cbc_stations[$station]} | cut -d '=' -f2`
      ;;

    mps|mplayershell)
      radio_cbc_player="$1|$(which mps)"
      echo -ne "${cyan}\n[radio_cbc] Chosen Player: $radio_cbc_player ${norm}"
      $(which mps) -vc null -nolirc -msglevel all=4 ${radio_capture} -msgcolor `echo ${cbc_stations[$station]} | cut -d '=' -f2`
      ;;

    mplayer|mplayer2)
      radio_cbc_player="$1|$(which mplayer)"
      echo -ne "${cyan}\n[radio_cbc] Chosen Player: $radio_cbc_player ${norm}"
      $(which mplayer) -vc null -vo null -nolirc -msglevel all=4 ${radio_capture} -msgcolor `echo ${cbc_stations[$station]} | cut -d '=' -f2`
      ;;

    ""|" ")
      radio_cbc_player="[null]|$(which mplayer)"
      echo -ne "${cyan}\n[radio_cbc] Chosen Player: $radio_cbc_player ${norm}"
      $(which mplayer) -vc null -vo null -nolirc -msglevel all=4 ${radio_capture} -msgcolor `echo ${cbc_stations[$station]} | cut -d '=' -f2`
      ;;

    *)
      # default
      radio_cbc_player="$1|$(which mplayer)"
      echo -ne "${cyan}\n[radio_cbc] Chosen Player: $radio_cbc_player ${norm}"
      $(which mplayer) -vc null -vo null -nolirc -msglevel all=4 ${radio_capture} -msgcolor `echo ${cbc_stations[$station]} | cut -d '=' -f2`
      ;;
  esac

echo -ne "${cyan}\n[radio_cbc] Press Enter to change station ${norm}"
  read -t 5
  [[ $? -gt 128 ]] && { echo && exit 0; }
# rm $tfile
  unset -v index station radio_capture
done

exit 0