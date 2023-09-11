ZSH_THEME="af-magic2"

alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"

alias af="alias-finder -e $1 && alias-finder -l $1"

ZSH_ALIAS_FINDER_AUTOMATIC=true

export GPG_TTY=$(tty)

# enable once https://github.com/robbyrussell/oh-my-zsh/pull/8062 is merged
#plugins=(alias-finder autojump brew extract git gitignore java mac mvn zsh-autosuggestions zsh-syntax-highlighting)

# remove these once the above is enabled.
source ${ZSH}/plugins/ansible/ansible.plugin.zsh
source ${ZSH}/plugins/autojump/autojump.plugin.zsh
source ${ZSH}/plugins/brew/brew.plugin.zsh
source ${ZSH}/plugins/extract/extract.plugin.zsh
source ${ZSH}/plugins/gh/gh.plugin.zsh
# source ${ZSH}/plugins/git/git.plugin.zsh
source ${ZSH}/plugins/gitignore/gitignore.plugin.zsh
source ${ZSH}/plugins/mvn/mvn.plugin.zsh
source ${ZSH}/plugins/terraform/terraform.plugin.zsh
source ${ZSH}/custom/plugins/alias-finder/alias-finder.plugin.zsh
source ${ZSH}/custom/plugins/java/java.plugin.zsh
if [[ "$OSTYPE" = darwin* ]]; then
  source ${ZSH}/custom/plugins/mac/mac.plugin.zsh
fi
source ${ZSH}/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ${ZSH}/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

#Pip certs
function setup-certs() {
    if command -v npm >/dev/null; then
        # place to put the combined certs
        local cert_path="$HOME/.certs/all.pem"
        local cert_dir=$(dirname "${cert_path}")
        [[ -d "${cert_dir}" ]] || mkdir -p "${cert_dir}"
        # grab all the certs
        security find-certificate -a -p /System/Library/Keychains/SystemRootCertificates.keychain > "${cert_path}"
        security find-certificate -a -p /Library/Keychains/System.keychain >> "${cert_path}"
        # configure env vars for commonly used tools
        export GIT_SSL_CAINFO="${cert_path}"
        export AWS_CA_BUNDLE="${cert_path}"
        export NODE_EXTRA_CA_CERTS="${cert_path}"
        export SSL_CERT_FILE="${cert_path}"
        export REQUESTS_CA_BUNDLE="${cert_path}"
        export SSL_CERT_FILE=$HOME/.certs/all.pem
        export REQUESTS_CA_BUNDLE=$HOME/.certs/all.pem
        # add the certs for npm and yarn
        # and since we have certs, strict-ssl can be true
        npm config set --location=global cafile "${cert_path}"
        npm config set --location=global strict-ssl true
        if command -v yarn >/dev/null; then
            # Doesn't seem to be necessary for yarn 3.x?
            if yarn --version | grep -E "^1" >/dev/null; then
                yarn config set cafile "${cert_path}" -g >/dev/null
                yarn config set strict-ssl true -g >/dev/null
            fi
        fi
    fi
}
setup-certs
