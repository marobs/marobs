##############################################################################
#
# Introduction
#
# Hey! Looks like you're setting up a new environment. Good luck buddy. Should
#
# This is the .zshrc file I have on my google macs (both local MBP and Mac Pro).
# This file should walk you through setting up .oh-my-zsh, p10k, and some
# additional configurations. To do that:
#
#  1. Install iTerm2
#  2. Install oh-my-zsh
#  3. Install p10k
#  4. Install the oh-my-zsh addons listed below)
#  5. Copy this file as your .zshrc
#  6. Update .p10k.zsh file to update POWERLEVEL9K_LEFT_PROMPT_ELEMENTS to add
#       os_icon if you want it.
#
##############################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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
# To install autosuggestions: git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# To install syntax highlighting: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# General
alias cdls="cd ls"

# Google
alias cloudtop="ssh marobs.c.googlers.com"
source /etc/bash_completion.d/hgd

# Git
alias gts="git status"
alias gp='git push origin HEAD:refs/for/master'

################################################################################
#
# Google Auth Env Aliases
#
################################################################################

# Tmux - Join session "macpro"
alias tmux_attach='tmx2 -CC a -t macpro'
alias tmux_create='tmx2 -CC new-session -s macpro'

# Cloudtop proxy commands
alias cex='ssh -t marobs.c.googlers.com -- "(gcertstatus --check_remaining=1h --quiet || gcert) && cd $PWD && "'
alias build_cleaner='cex build_cleaner'

# Alias gerrit-init to set up Change-Id hook
alias gerrit-init="git rev-parse --is-inside-work-tree &> /dev/null && (cd \"\`git rev-parse --show-toplevel --git-dir | tr \"\n\" \"/\"\`\" && curl -Lo hooks/commit-msg https://gerrit-review.googlesource.com/tools/hooks/commit-msg 2> /dev/null; chmod +x hooks/commit-msg; echo \"Successfully initialized\") || echo \"Not in a git repository\""

# Alias for changing directory to google3
alias cdg='cd /google/src/head/depot/google3'
alias cdh='cd /google/src/cloud/marobs'
alias cdtt='cd /google/src/head/depot/google3/java/com/google/fitbit/platform/regulated/tooling/traceability'

# Alias for starting ftu on mac pro
alias fftu='cd /google/src/head/depot/google3 && /usr/local/bin/blaze run //fitbit/migration/devtools:legacy_build_tunnel --config=darwin_x86_64'

################################################################################
#
# Michael functionality
#
################################################################################

source ~/admin_apnea_scripts.sh
source ~/scripts.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/marobs/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/marobs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/marobs/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/marobs/google-cloud-sdk/completion.zsh.inc'; fi
[[ -e "/Users/marobs/mdproxy/data/mdproxy_zshrc" ]] && source "/Users/marobs/mdproxy/data/mdproxy_zshrc" # MDPROXY-ZSHRC
