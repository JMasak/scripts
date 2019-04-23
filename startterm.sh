#!/bin/bash

#get list of available fonts and have the user select one with rofi
FONT=$(fc-list -f "%{family[0]}\n" | sort | uniq | rofi -dmenu -p "Select font")

#available colors for urxvt
COLORS=( black red green yellow blue magenta cyan white)
#font sizes to select from
SIZES=( 8 10 12 14 16 18 20 22 )

#let the user select the background color
BACKGROUND=$((for i in ${COLORS[@]}; do echo $i; done) | rofi -dmenu -p "Select background color")
#let the user select the foreground color
FOREGROUND=$((for i in ${COLORS[@]}; do echo $i; done) | rofi -dmenu -p "Select foreground color")
#let the user select the font size
SIZE=$((for i in ${SIZES[@]}; do echo $i; done) | rofi -dmenu -p "Select font size")

#exit if user has not selected a parameter
[ -z "$FONT" ] && exit 1
[ -z "$BACKGROUND" ] && exit 2
[ -z "$FOREGROUND" ] && exit 3
[ -z "$SIZE" ] && exit 4

#start urxvt with the selected parameters
urxvt -bg $BACKGROUND -fg $FOREGROUND +sb -fn "xft:$FONT:pixelsize=$SIZE"
