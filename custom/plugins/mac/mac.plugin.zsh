alias screensaver="/System/Library/CoreServices/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine"

function volume() { sudo osascript -e "set Volume $1";}
function network() {
  # $1 interface
  # $2 on or off
  networksetup -setairportpower $1 $2 ;
}
