#!/usr/local/bin/bash

# ref:
# original: http://www.ejectamenta.com/online-apps/mplayer_bbc_radio_script.html

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
echo '     ___           ___           ___                       ___                    ___           ___           ___
     /\  \         /\  \         /\  \          ___        /\  \                  /\  \         /\  \         /\  \
    /::\  \       /::\  \       /::\  \        /\  \      /::\  \                /::\  \       /::\  \       /::\  \
   /:/\:\  \     /:/\:\  \     /:/\:\  \       \:\  \    /:/\:\  \              /:/\:\  \     /:/\:\  \     /:/\:\  \
  /::\~\:\  \   /::\~\:\  \   /:/  \:\__\      /::\__\  /:/  \:\  \            /::\~\:\__\   /::\~\:\__\   /:/  \:\  \
 /:/\:\ \:\__\ /:/\:\ \:\__\ /:/__/ \:|__|  __/:/\/__/ /:/__/ \:\__\          /:/\:\ \:|__| /:/\:\ \:|__| /:/__/ \:\__\
 \/_|::\/:/  / \/__\:\/:/  / \:\  \ /:/  / /\/:/  /    \:\  \ /:/  /          \:\~\:\/:/  / \:\~\:\/:/  / \:\  \  \/__/
    |:|::/  /       \::/  /   \:\  /:/  /  \::/__/      \:\  /:/  /            \:\ \::/  /   \:\ \::/  /   \:\  \
    |:|\/__/        /:/  /     \:\/:/  /    \:\__\       \:\/:/  /              \:\/:/  /     \:\/:/  /     \:\  \
    |:|  |         /:/  /       \::/__/      \/__/        \::/  /                \::/__/       \::/__/       \:\__\
     \|__|         \/__/         ~~                        \/__/                  ~~            ~~            \/__/
'


bbc_stations=(
"[BBC] Radio 1"="http://www.listenlive.eu/bbcradio1.m3u"
"[BBC] Radio 1"Xtra="http://www.listenlive.eu/bbcradio1x.m3u"
"[BBC] Radio 2"="http://www.listenlive.eu/bbcradio2.m3u"
"[BBC] Radio 3"="http://www.listenlive.eu/bbcradio3.m3u"
"[BBC] Radio 4"="http://www.listenlive.eu/bbcradio4.m3u"
"[BBC] Radio 4Xtra"="http://www.listenlive.eu/bbcradio4extra.m3u"
"[BBC] Radio 5_Live"="http://www.listenlive.eu/bbc5live.m3u"
"[BBC] Radio 5_LiveXtra"="http://www.listenlive.eu/bbc5liveextra.m3u"
"[BBC] Radio 6"="http://www.listenlive.eu/bbcradio6.m3u"
"[BBC] Asian"="http://www.listenlive.eu/bbcasian.m3u"
"[BBC] Radio 3"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-aac-lc-a/format/pls/vpid/bbc_radio_three.pls"
"[BBC] Radio Berkshire"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_berkshire/format/pls.pls"
"[BBC] Radio Bristol"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_bristol/format/pls.pls"
"[BBC] Radio Cambridge"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_cambridge/format/pls.pls"
"[BBC] Radio Cornwall"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_cornwall/format/pls.pls"
"[BBC] Radio Coventry_Warwickshire"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_coventry_warwickshire/format/pls.pls"
"[BBC] Radio Cumbria"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_cumbria/format/pls.pls"
"[BBC] Radio Derby"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_derby/format/pls.pls"
"[BBC] Radio Devon"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_devon/format/pls.pls"
"[BBC] Radio Essex"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_essex/format/pls.pls"
"[BBC] Radio Gloucestershire"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_gloucestershire/format/pls.pls"
"[BBC] Radio Guernsey"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_guernsey/format/pls.pls"
"[BBC] Radio Hereford"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_hereford_worcester/format/pls.pls"
"[BBC] Radio Humberside"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_humberside/format/pls.pls"
"[BBC] Radio Jersey"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_jersey/format/pls.pls"
"[BBC] Radio Kent"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_kent/format/pls.pls"
"[BBC] Radio Lancashire"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_lancashire/format/pls.pls"
"[BBC] Radio Leeds"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_leeds/format/pls.pls"
"[BBC] Radio Leicester"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_leicester/format/pls.pls"
"[BBC] Radio Lincolnshire"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_lincolnshire/format/pls.pls"
"[BBC] Radio London"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_london/format/pls.pls"
"[BBC] Radio Manchester"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_manchester/format/pls.pls"
"[BBC] Radio Merseyside"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_merseyside/format/pls.pls"
"[BBC] Radio Norfolk"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_newcastle/format/pls.pls"
"[BBC] Radio Northhampton"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_norfolk/format/pls.pls"
"[BBC] Radio Norfolk"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_northampton/format/pls.pls"
"[BBC] Radio Nottingham"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_nottingham/format/pls.pls"
"[BBC] Radio Oxford"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_oxford/format/pls.pls"
"[BBC] Radio Sheffield"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_sheffield/format/pls.pls"
"[BBC] Radio Shropshire"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_shropshire/format/pls.pls"
"[BBC] Radio Solent"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_solent/format/pls.pls"
"[BBC] Radio Somerset_Sound"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_somerset_sound/format/pls.pls"
"[BBC] Radio Stoke"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_stoke/format/pls.pls"
"[BBC] Radio Suffolk"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_suffolk/format/pls.pls"
"[BBC] Radio Surrey"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_surrey/format/pls.pls"
"[BBC] Radio Sussex"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_sussex/format/pls.pls"
"[BBC] Radio Tees"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_tees/format/pls.pls"
"[BBC] Radio Three_Counties"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_three_counties_radio/format/pls.pls"
"[BBC] Radio Wiltshire"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_wiltshire/format/pls.pls"
"[BBC] Radio WM"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_wm/format/pls.pls"
"[BBC] Radio York"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_york/format/pls.pls"
"[BBC] Radio Cymru"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_cymru/format/pls.pls"
"[BBC] Radio Ulster"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_ulster/format/pls.pls"
"[BBC] Radio Folye"="http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_foyle/format/pls.pls"
)


while(true); do
  index=0
  echo
  for i in "${bbc_stations[@]}"; do
    echo ${ser}$index.${norm} ${name}${i%%=*}${norm}
    index=$[index+1]
  done

  echo
  read -p "${blue}BBC Station:${norm} " station
  echo

  capture="-capture -dumpfile ${bbc_stations[$station]%%=*}_`date "+%T_%F"`.mp3"

  radio_bbc_player="${1,yy}" # convert argument to lower-case; bash >4
  # radio_bbc_player="(echo $1 | tr '[:upper:]' '[:lower:]')" # convert argument to lower-case; bash <4
  # radio_bbc_player="$(echo $1 | awk '{print tolower($0)}')" # convert argument to lower-case; awk

  case $radio_bbc_player in
    mpv)
      radio_bbc_player="$1|$(which mpv)"
      echo -ne "${cyan}\n[radio_bbc] Chosen Player: $radio_bbc_player ${norm}"
      $(which mpv) --no-video `echo ${bbc_stations[$station]} | cut -d '=' -f2`
      ;;

    mps|mplayershell)
      radio_bbc_player="$1|$(which mps)"
      echo -ne "${cyan}\n[radio_bbc] Chosen Player: $radio_bbc_player ${norm}"
      $(which mps) -vc null -nolirc -msglevel all=4 ${capture} -msgcolor `echo ${bbc_stations[$station]} | cut -d '=' -f2`
      ;;

    mplayer|mplayer2)
      radio_bbc_player="$1|$(which mplayer)"
      echo -ne "${cyan}\n[radio_bbc] Chosen Player: $radio_bbc_player ${norm}"
      $(which mplayer) -vc null -vo null -nolirc -msglevel all=4 -msgcolor -quiet -playlist `echo ${bbc_stations[$station]} | cut -d '=' -f2`
      ;;

    ""|" ")
      radio_bbc_player="[null]|$(which mplayer)"
      echo -ne "${cyan}\n[radio_bbc] Chosen Player: $radio_bbc_player ${norm}"
      $(which mplayer) -vc null -vo null -nolirc -msglevel all=4 -msgcolor -quiet -playlist `echo ${bbc_stations[$station]} | cut -d '=' -f2`
      ;;

    *)
      # default
      radio_bbc_player="$1|$(which mplayer)"
      echo -ne "${cyan}\n[radio_bbc] Chosen Player: $radio_bbc_player ${norm}"
      $(which mplayer) -vc null -vo null -nolirc -msglevel all=4 -msgcolor -quiet -playlist `echo ${bbc_stations[$station]} | cut -d '=' -f2`
      ;;
  esac

echo -ne "${cyan}\n[radio_bbc] Press Enter to change station ${norm}"
  read -t 5
  [[ $? -gt 128 ]] && { echo && exit 0; }
# rm $tfile
  unset -v index station capture
done

exit 0