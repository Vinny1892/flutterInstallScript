#! /bin/bash

flutterSDK=https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.9.1+hotfix.6-stable.tar.xz
commandLineToolsAndroid=https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip

function installFlutterSDK(){
    cd /tmp
    sudo wget  -P /tmp -O flutterSDK.tar.xz $flutterSDK
    sudo tar xvf  /tmp/flutterSDK.tar.xz
    sudo mv flutter /opt/flutterSDK
    cd $HOME
    sudo echo "export PATH=\$PATH:/opt/flutterSDK/bin" >> .zshrc
    sudo echo "export PATH=\$PATH:/opt/flutterSDK/bin" >> .bashrc
    source .zshrc
    source .bashrc
    sudo chown  -R $USER:$USER /opt/flutterSDK
    
}



function installCommandoLineAndroid(){
    cd /tmp
    sudo wget -P /tmp -O commandLineAndroid.zip $commandLineToolsAndroid
    unzip commandLineAndroid.zip -d  commandLineToolsAndroid
    sudo mv  commandLineToolsAndroid  /opt/commandLineToolsAndroid
    cd $HOME
    echo "export PATH=\$PATH:/opt/commandLineToolsAndroid/tools/bin" >> .zshrc
    echo "export PATH=\$PATH:/opt/commandLineToolsAndroid/tools/bin" >> .bashrc
    source .zshrc
    source .bashrc
    #Install sdkAndroid
    cd /opt
    sdkmanager
    echo "Criando sdkAndroid"
    mkdir sdkAndroid
    cd sdkAndroid
    sdkmanager "system-images;android-28;google_apis_playstore;x86_64"
    sdkmanager "platform-tools"
    sdkmanager "build-tools;28.0.3"
    sdkmanager "platforms;android-28"
    sdkmanager "emulator"
    sdkmanager --licenses
    flutter config --android-sdk /opt/commandLineToolsAndroid
    
}



installFlutterSDK
installCommandoLineAndroid