function volume() { sudo osascript -e "set Volume $1";}
function network() { networksetup -setairportpower $1 $2 ;}
