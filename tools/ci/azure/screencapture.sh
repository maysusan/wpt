#!/bin/bash

PREFIX="$1"
VIDEO=true

get_filename () {
  EXT="$1"
  NOW=`date -u "+%Y-%m-%d_%H-%M-%S"`
  echo "${PREFIX}_${NOW}.${EXT}"
}

if [ "$VIDEO" = "true" ]; then
  # capture 10 seconds of video every 10 minutes for at most 2 hours
  seq 12 | while read counter; do
    FILENAME=`get_filename mov`
    screencapture -V 10 "$FILENAME"
    sleep 590
  done
else
  # capture screenshots every 10 seconds for at most 2 hours
  seq 720 | while read counter; do
    FILENAME=`get_filename jpg`
    screencapture -t jpg "$FILENAME"
    sleep 10
  done
fi
