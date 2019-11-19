ZSH_THEME="lukerandall"

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"

# enable once https://github.com/robbyrussell/oh-my-zsh/pull/8062 is merged
#plugins=(autojump brew extract gitignore java mac)

# remove these once the above is enabled.
source ${ZSH}/plugins/autojump/autojump.plugin.zsh
source ${ZSH}/plugins/brew/brew.plugin.zsh
source ${ZSH}/plugins/extract/extract.plugin.zsh
source ${ZSH}/plugins/gitignore/gitignore.plugin.zsh
source ${ZSH}/custom/plugins/java/java.plugin.zsh
source ${ZSH}/custom/plugins/mac/mac.plugin.zsh
