#!/bin/bash

function checkingMsg() {
    toolname=$1
    echo "Checking if '$toolname' is installed..."
}

function printInstallMsg() {
    toolname=$1
    echo >&2 "$toolname not found; installing..."
}
# 0. install carthage
checkingMsg "carthage"
brew list carthage >/dev/null 2>&1 || { printInstallMsg "carthage"; brew install carthage; }

# 1. install ios-deploy
checkingMsg "ios-deploy"
brew list ios-deploy >/dev/null 2>&1 || { printInstallMsg "ios-deploy"; brew install ios-deploy; }

# 3. install ideviceinstaller
checkingMsg "ideviceinstaller"
brew list ideviceinstaller >/dev/null 2>&1 || { printInstallMsg "ideviceinstaller"; brew install ideviceinstaller; }

# 4. install ios-webkit-debug-proxy
checkingMsg "ios-webkit-debug-proxy"
brew list ios-webkit-debug-proxy >/dev/null 2>&1 || { printInstallMsg "ios-webkit-debug-proxy"; brew install ios-webkit-debug-proxy; }

# 5. install appium
checkingMsg "appium"
command -v appium >/dev/null 2>&1 || { printInstallMsg "appium"; npm install -g appium; }

# optional install of lyft/set-location-simulator
# brew install lyft/formulae/set-simulator-location

# 6. install appium-doctor
checkingMsg "appium-doctor"
command -v appium-doctor >/dev/null 2>&1 || { printInstallMsg "appium-doctor"; npm install -g appium-doctor; }

# 7. run appium-doctor
# if xcrun simctl has an error, you need to set Location in XCode
# https://stackoverflow.com/a/54876998
appium-doctor

echo
echo "====================== If you see these errors! ======================"
echo
echo "If xcrun simctl has an error, you need to set Location in XCode."
echo "  See: https://stackoverflow.com/a/54876998"
echo
echo "If you get an error about the 'Bin' folder not being set in JAVA_HOME, "
echo "you need to add '\${JAVA_HOME}/bin' to the PATH "
echo "(even if you already have JAVA_HOME in the PATH)"
echo