#! /bin/bash

VBR="500k"
FPS="30"
QUAL="veryfast"
RTMP_URL="rtmps"
RTMP_KEY="rtmp key"
VIDEO_SOURCE="videos/your.mp4"
AUDIO_SOURCE="mp3/your.mp3"
AUDIO_ENCODER="aac"

ffmpeg \
 -stream_loop -1 \
 -re \
 -i "$VIDEO_SOURCE" \
 -thread_queue_size 512 \
 -stream_loop -1 \
 -i "$AUDIO_SOURCE" \
 -c:v libx264 -preset $QUAL -r $FPS -g $FPS -b:v $VBR>
 -c:a $AUDIO_ENCODER -threads 2 -ar 44100 -b:a 128k ->
 -fflags +shortest -max_interleave_delta 50000 \
 -f flv $RTMP_URL/$RTMP_KEY
