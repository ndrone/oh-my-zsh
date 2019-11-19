ZSH_THEME="lukerandall"

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
function volume() { sudo osascript -e "set Volume $1";}
function network() { networksetup -setairportpower $1 $2 ;}

# java version alias
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)

alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"
alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'

# default to Java 11
java11

# enable once https://github.com/robbyrussell/oh-my-zsh/pull/8062 is merged
#plugins=(autojump brew extract)

# remove these once the above is enabled.
source ${ZSH}/plugins/autojump/autojump.plugin.zsh
source ${ZSH}/plugins/brew/brew.plugin.zsh
