#!/bin/bash
set -e

sudo apt install -y \
  dosbox \
  gvfs:i386 \
  gstreamer1.0-libav:i386 \
  gstreamer1.0-plugins-bad:i386 \
  gstreamer1.0-plugins-ugly \
  gstreamer1.0-tools:i386 \
  opus-tools:i386 \
  gstreamer1.0-alsa \
  timidity \
  gstreamer1.0-plugins-ugly:i386 \
  mingw-w64 \
  flvmeta \
  smpeg-plaympeg \
  lame \
  mjpegtools \
  x265 \
  x264 \
  mpv \
  mpg123 \
  libxvidcore4 \
  fluidsynth \
  mono-complete \
  easyeffects \
  lsp-plugins-lv2 \
  calf-plugins \
  x42-plugins \
  zam-plugins

sudo apt purge -y speech-dispatcher
sudo apt autoremove -y

# DEKSTOP ONLY !!!!
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
