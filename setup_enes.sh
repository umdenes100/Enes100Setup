#!/bin/bash

apt update
apt upgrade

# CORE PACKAGES - OPEN_CV, QT, ARUCO

# Setting up a Downloads folder if it doesn't already exist.
mkdir -p ~/Downloads

# Library links.
OPENCV_LINK="https://github.com/opencv/opencv/archive/3.4.1.zip"
ARUCO_LINK="https://downloads.sourceforge.net/project/aruco/3.0.0/aruco-3.0.9.zip"
QT_LINK="http://download.qt.io/official_releases/qt/5.11/5.11.0/qt-opensource-linux-x64-5.11.0.run"

# Pre-reqs
apt install build-essential -y
apt install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev -y
apt install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev -y
apt install v4l-utils
apt install unzip

# Installing OpenCV
cd ~/Downloads
wget $OPENCV_LINK && unzip 3.4.1.zip && rm 3.4.1.zip
cd opencv-3.4.1 && mkdir build && cd build && cmake .. && make install

# Installing ArUco
cd ~/Downloads
wget $ARUCO_LINK && unzip aruco-3.0.9.zip && rm aruco-3.0.9.zip
cd aruco-3.0.9 && mkdir build && cd build && cmake .. && make install

# Installing QT5
cd ~/Downloads
wget $QT_LINK
chmod +x qt-opensource-linux-x64-5.11.0.run && ./qt-opensource-linux-x64-5.11.0.run

# Installing QT Add-Ons
apt install libfontconfig1 -y
apt install mesa-common-dev -y
apt install libglu1-mesa-dev -y
apt install libcanberra-gtk-module -y
apt install --no-install-recommends gnome-panel -y

# Adding enes100 user to USB access group.
usermod -a -G dialout enes100


apt update
apt upgrade

# ENES100 REPOS

# VSR -> Vision System Remote

VSR_LINK="https://github.com/umdenes100/VisionSystemRemote.git"

mkdir -p ~/Development && cd ~/Development

# Downloading repos.
git clone $VSR_LINK

cd ~
