#! /bin/bash

flutterSDK=https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.9.1+hotfix.6-stable.tar.xz



cd /tmp
sudo wget  -P /tmp -O flutterSDK.tar.xz $flutterSDK
sudo tar xvf  /tmp/flutterSDK.tar.xz
sudo mv flutter /opt/flutterSDK
cd $HOME
sudo echo "export PATH=\$PATH:/opt/flutterSDK/bin" >> .zshrc


