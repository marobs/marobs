# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

################################################################################
#
# iTerm2 Configuration
#
################################################################################

# In order to use Option plus arrow keys to navigate in iTerm2, you need to update
# the keybinds. This can be done by going to:
#   - `Preferences... > Profiles > Keys > Key Mappings`
#   - Press `Presets`
#   - Select `Natural Text Editing`
# I removed any bound keys before reloading, then needed to quit (cmd+q) out of 
# iTerm2 before the settings took hold.

# More info here: https://apple.stackexchange.com/questions/154292/iterm-going-one-word-backwards-and-forwards

################################################################################
#
# Oh-my-zsh configuration
#
################################################################################

# The first step in configuring zsh is installing oh-my-zsh. To do this,
# run the commands:
#
#     curl -Lo install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
#     sh install.sh


################################################################################
#
# Powerlevel10k Configruation
#
################################################################################

# In order to install p10k, you'll need to:
#
#   1. Run the commands:
# 
#            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
#            echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
#
#   2. Restart zsh (cmd+q)
#   3. Type `p10k configure` if the wizard doesn't start automatically
#
# To just copy the profile from an already-configured p10k, copy ~/.p10k.zsh

# More information: https://github.com/romkatv/powerlevel10k

################################################################################
#
# zsh configuration
#
################################################################################

# Path to your oh-my-zsh installation.
export ZSH="/Users/marobs/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set up zsh plugins to load
# To install autosuggestions: git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions\n
# To install syntax highlighting: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting\n
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

################################################################################
#
# Environment configuration
#
################################################################################

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/

# Include fitbit-managed files
export PATH="/Users/marobs/fitbit/bin/releases/bootstrap:${PATH}"
export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:/google/src/head/depot/google3/fitbit/migration/devtools/bootstrap-bin:/usr/local/google/home/gcampfield/fitbit/bin/releases/gcp-rbac:/usr/local/google/home/gcampfield/fitbit/bin/releases/devprod:"

# Include profile.d files.
for i in ~/profile.d/*.sh ; do
     if [ -r "$i" ]; then
          . $i
     fi
done

################################################################################
#
# Disable tabbing autocomplete
#
################################################################################

setopt noautomenu
setopt nomenucomplete

################################################################################
#
# Google tooling
#
################################################################################

# -f means "if this file exists". So, if /etc/bash_completion.d/g4d exists, 
# source both of these files.
if [[ -f /etc/bash_completion.d/g4d ]]; then
  source /etc/bash_completion.d/p4
  source /etc/bash_completion.d/g4d
fi

################################################################################
#
# ls
#
################################################################################

# On Mac OS X, ls shows colors if CLICOLOR env variable is set
export CLICOLOR=1

# Colors are set through the LSCOLORS env variable
export LSCOLORS=ExFxBxDxCxegedabagacad

################################################################################
#
# Aliases
#
################################################################################

# Google
alias cloudtop="ssh marobs.c.googlers.com"

# Git
alias gts="git status"

################################################################################
#
# Michael functionality
#
################################################################################

admin_assessment () {
    re='^[0-9]+$'
    if [ -z "$1" ] ; 
    then
        echo "Usage: admin_assessment <unencoded_id>"
    else
        if ! [[ $1 =~ $re ]] ; 
        then
            echo "Usage: admin_assessment <unencoded_id>"
        else
            curl -v --resolve sleep-apnea-prod.site-ops.fitbit.com:443:127.0.0.145 https://sleep-apnea-prod.site-ops.fitbit.com/1/user/$1/sleep-apnea/admin/assessment
        fi
    fi
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
