#!/bin/bash
set -e

sudo apt update
sudo apt install -y \
  libgif7 \
  libgif7:i386 \
  libglfw3 \
  libglfw3:i386 \
  libgstreamer-plugins-base1.0-0 \
  libgstreamer-plugins-base1.0-0:i386 \
  libgtk-3-0 \
  libgtk-3-0:i386 \
  libjpeg62-turbo \
  libjpeg62-turbo:i386 \
  ocl-icd-libopencl1 \
  ocl-icd-libopencl1:i386 \
  libopenal1 \
  libopenal1:i386 \
  libxslt1.1 \
  libxslt1.1:i386 

sudo apt install -y \
  dosbox \
  gvfs \
  ffmpeg \
  gstreamer1.0-libav \
  gstreamer1.0-libav:i386 \
  gstreamer1.0-plugins-good \
  gstreamer1.0-plugins-good:i386 \
  gstreamer1.0-plugins-bad \
  gstreamer1.0-plugins-bad:i386 \
  gstreamer1.0-plugins-ugly \
  gstreamer1.0-plugins-ugly:i386 \
  gstreamer1.0-alsa \
  gstreamer1.0-tools \
  opus-tools \
  timidity \
  mingw-w64 \
  flvmeta \
  smpeg-plaympeg \
  lame \
  mjpegtools \
  x265 \
  x264 \
  mpv \
  mpg123 \
  libmpg123-0 \
  libmpg123-0:i386 \
  libxvidcore4 \
  fluidsynth \
  mono-complete \
  easyeffects \
  lsp-plugins-lv2 \
  calf-plugins \
  x42-plugins \
  zam-plugins
