#==================================================================
#
#
#   ███████╗██╗      █████╗  █████╗ ██╗██╗  ██╗
#   █╔══██╔╝██║     ██╔══██╗██╔═══╝ ╚═╝███╗ ██║
#   ╚╝███╔╝ ██║     ██║  ██║██║███╗ ██╗███████║
#    ██╔═╝█╗██║     ██║  ██║██║╚═██╗██║██╔═███║
#   ███████║███████╗╚█████╔╝╚█████╔╝██║██║ ╚██║
#   ╚══════╝╚══════╝ ╚════╝  ╚════╝ ╚═╝╚═╝  ╚═╝
#
#
# 	.zlogin configuration by adipopbv (adi.pop.bv@gmail.com).
# 	~/.zlogin - Zsh login processes (startx, headset connenct etc).
# 	Go to http://zsh.sourceforge.net/Doc/ for more info.
#
#
#==================================================================

# Start graphical server X11
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
fi

