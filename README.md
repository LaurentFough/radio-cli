# radio-cli

shell functions for streaming Internet Radio via the commandline.

## Overview

`radio-cli` collection of scripts, resources, information and techniques for streaming Internet Radio via the the commandline.

# Description

Scripts & resources for accessing Internet Radio Streams via the commandline.

# Setup

## Dependencies

These should be available in your `$PATH`.  

 - copy any of the scripts to your `$HOME/bin` dir,  
 - then `chmod +x` them will make them functional.
 - **[TODO]** If you add additional dependencies, please indicate them in `dependencies.list`, which will be checked at startup.

### bash, zsh, sh

Most of the included scripts are bash functions. Not having bash would make it awkward to use.
There is major cross-compatibility with zsh/sh, etc.

- **[TODO]** convert to fish. Because [fish-shell](https://github.com/fish-shell/fish-shell).

### mplayer

Primary/ preferred music player.
 - [TODO] add additional functionality to gracefully handle missing media players

### mplayer2, mplayershell(mps), mpv, mpd

Secondary/ supported music players.
 - **[TODO]** add additional functionality to gracefully handle missing media players

# Usage

> `radio_$source[.sh]`  

 - where `$source` is stream provider: *CBC Radio, BBC Radio, SOMAFM, NPR,* etc

## Debugging

**[TODO]** Incorporating a robust debugging infrastructure.

# Structure

## originals/*

original scripts with references to where found on the internet.

## streams/streams_*

A list of streams as provided by stream provider.  

  - e.g. `streams_cbc.txt`: contains CBC Radio Streams.

# License
[MIT](https://tldrlegal.com/license/mit-license)

# Contributors
* [Laurent Fough](https://laurentfough.github.io/) | [e-mail](mailto:laurent@fough3.net) | [Twitter](https://twitter.com/LaurentFough)