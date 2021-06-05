#===================================================================
#
#
#   ███████╗ █████╗ ██╗  ██╗███████╗██╗  ██╗██╗  ██╗
#   █╔══██╔╝███╔══█╗██║  ██║██╔════╝███╗ ██║██║  ██║
#   ╚╝███╔╝ ╚█████╚╝███████║█████╗  ███████║╚██╗██╔╝
#    ██╔═╝█╗█╗  ███╗██╔══██║██╔══╝  ██╔═███║ █████║ 
#   ███████║╚█████╔╝██║  ██║███████╗██║ ╚██║ ╚███╔╝ 
#   ╚══════╝ ╚════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝  ╚══╝  
#
#
# 	.zshenv configuration by adipopbv (adi.pop.bv@gmail.com).
# 	~/.zshenv - Zsh environmental settings (variables, aliases etc).
# 	Go to http://zsh.sourceforge.net/Doc/ for more info.
#
#
#===================================================================

# Unlock keyring
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# PATH variable
# 	include user's private binaries
if [ -d "$HOME/.local/bin" ] ; then ; export PATH="$PATH:$HOME/.local/bin" ; fi
#	include optional binaries
if [ -d "/opt/bin" ] ; then ; export PATH="$PATH:/opt/bin" ; fi
#	include golang binaries
if [ -d "/usr/local/go/bin" ] ; then ; export PATH="$PATH:/usr/local/go/bin" ; fi
#	include homebrew binaries
if [ -d "/home/linuxbrew/.linuxbrew" ] ; then ; export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin" ; fi

# MANPATH variable
#	include homebrew manual
if [ -d "/home/linuxbrew/.linuxbrew/share/man" ] ; then ; export MANPATH="$MANPATH:/home/linuxbrew/.linuxbrew/share/man" ; fi

# INFOPATH variable
#	include homebrew info
if [ -d "/home/linuxbrew/.linuxbrew/share/info" ] ; then ; export INFOPATH="$INFOPATH:/home/linuxbrew/.linuxbrew/share/info" ; fi

# SCRIPTSPATH variable
if [ -d "$HOME/.scripts" ] ; then
	# set scripts path
	export SCRIPTSPATH="$HOME/.scripts" 
	# include scripts in the path
	export PATH="$PATH:$SCRIPTSPATH/bin"
fi

# EDITOR variable
# 	set the default editor to neovim
if [ -f "/usr/bin/nvim" ] ; then ; export EDITOR="nvim" ; fi

# TERMINAL variable
# 	set the default terminal to kitty
if [ -f "/usr/bin/kitty" ] ; then ; export TERMINAL="kitty" ; fi

# EXPLORER variable
# 	set the default file explorer to ranger
if [ -f "/usr/bin/ranger" ] ; then ; export EXPLORER="ranger" ; fi

# BROWSER variable
# 	set the default web browser to firefox nightly
if [ -f "/usr/bin/firefox-nightly" ] ; then ; export BROWSER="firefox-nightly"
# 	set the default web browser to firefox if the other is not installed
elif [ -f "/usr/bin/firefox" ] ; then ; export BROWSER="firefox" ; fi

# PYTHONPATH variable
# 	set tensorflow package location
export PYTHONPATH="$PYTHONPATH:/opt/tensorflow/models/research"

# oh-my-zsh plugin manager
# 	set the path to the oh-my-zsh installation
if [ -d "$HOME/.oh-my-zsh" ] ; then ; export ZSH="$HOME/.oh-my-zsh" ; fi

# pipes screensaver script
if [ -f "$HOME/.scripts/pipes/pipes.sh" ] ; then ; alias pipes="$HOME/.scripts/pipes/pipes.sh" ; fi

# covid-19 tracker cli
# 	romania
alias covid19-tracker-ro="curl https://covid19.trackercli.com/history/ro"
# 	spain
alias covid19-tracker-es="curl https://covid19.trackercli.com/history/es"
# 	italy
alias covid19-tracker-it="curl https://covid19.trackercli.com/history/it"
# 	germany
alias covid19-tracker-ge="curl https://covid19.trackercli.com/history/ge"

