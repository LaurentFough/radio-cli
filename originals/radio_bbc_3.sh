# ref:original: bbcradio
# ref:source: http://www.commandlinefu.com/commands/view/4070/listen-to-bbc-radio-from-the-command-line.

bbcradio() { local s PS3="Select a station: ";select s in 1 1x 2 3 4 5 6 7 "Asian Network an" "Nations & Local lcl";do break;done;s=($s);mplayer -playlist "http://www.bbc.co.uk/radio/listen/live/r"${s[@]: -1}".asx";}