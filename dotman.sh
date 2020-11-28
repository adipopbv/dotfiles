#!/bin/env sh
#=============================================================================
#
#
#   ██████╗  █████╗ ███████╗██╗  ██╗ █████╗ ██╗  ██╗
#   ██╔══██╗██╔══██╗╚═██╔══╝███╗███║██╔══██╗███╗ ██║
#   ██║  ██║██║  ██║  ██║   ███████║███████║███████║
#   ██║  ██║██║  ██║  ██║   ██╔█╔██║██╔══██║██╔═███║
#   ██████╔╝╚█████╔╝  ██║   ██║╚╝██║██║  ██║██║ ╚██║
#   ╚═════╝  ╚════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
#
#
#   Copyright (C) 2020-present Pop Adrian (adipopbv, adi.pop.bv@gmail.com).
#   dotman - utility for managing linux configurations.
#
#
#=============================================================================

init ()
{
	echo "Initializing dotman..."
	echo

	# creating symbolic link to scripts bin or local bin
	if [ -d ~/.scripts/bin ] ; then
		ln -s ~/dotfiles/dotman.sh ~/.scripts/bin/dotman
	else
		ln -s ~/dotfiles/dotman.sh ~/.local/bin/dotman
	fi

	# print status
	test $? -eq 0 && echo "Operation successful."
}

set ()
{
	if [ $# -eq 0 ] ; then
		echo "No argument given. Run with 'dotman config --help' for more info."
		exit 1
	fi

	echo "Setting config to $1..."
	echo

	# abort if config inexistent
	if [ ! -e ~/dotfiles/configs/$1 ] ; then
		echo "Error: no config with that name."
		exit 2
	fi

	# update current config
	rm -r ~/dotfiles/current-config
	mkdir ~/dotfiles/current-config
	cp -r ~/dotfiles/configs/$1/* ~/dotfiles/current-config
	# symlink current config files to original locations
	cd ~/dotfiles/current-config
	stow * -t ../.. --adopt
	cd ../..

	# print status
	test $? -eq 0 && echo "Operation successful."
}

create ()
{
	if [ $# -eq 0 ] ; then
		echo "No argument given. Run with 'dotman config --help' for more info."
		exit 1
	fi

	echo "Creating new config named $1..."
	echo

	if [ -e ~/dotfiles/configs/$1 ] ; then
		echo "Warning: a config with that name already exists!"
		printf "    Do you want to override it? (y/N): "
		read response
		echo
		case $response in
			y)
				echo "Overriding $1 config..."
				echo
				rm -r ~/dotfiles/configs/$1
				;;

			*)
				echo "Operation aborted."
				return
				;;

		esac
	fi

	# creating the config
	mkdir ~/dotfiles/configs/$1
	cp -r ~/dotfiles/current-config/* ~/dotfiles/configs/$1

	# print status
	test $? -eq 0 && echo "Operation successful."
}

config-help () 
{
	echo "Command for configurations settings."
	echo
	echo "USAGE:"
	echo "    dotman config [OPTION]... <SUBCOMMAND>..."
	echo
	echo "OPTIONS:"
	echo "    -h, --help             Prints this help message and exits"
	echo "    -r, --reload           Reloads WM configuration and restarts it"
	echo                             
	echo "SUBCOMMANDS:"              
	echo "    list                   Lists available configurations"
	echo "    set <CONFIGNAME>       Sets a configuration"
	echo "    create <CONFIGNAME>    Creates a new configuration"

	exit 0
}

config-invalid-argument ()
{
	echo "No such argument. Run with 'dotman config --help' for more info."
	exit 1
}

config ()
{
	RELOAD_i3=1

	if [ $# -eq 0 ] ; then
		echo "No argument given. Run with 'dotman config --help' for more info."
		exit 1
	fi

	while [ $# -gt 0 ] ; do
		case $1 in
			-h|--help)
				shift
				config-help
				;;
    
			-r|--reload)
				shift
				RELOAD_i3=0
				;;
    
			list)
				shift
				echo "Available configurations:"
				echo
				ls -l ~/dotfiles/configs | grep "^d" | awk '{ print $9 }'
				;;
    
			set)
				shift
				set $@
				shift
				;;

			create)
				shift
				create $@
				shift
				;;

			*)
				shift
				config-invalid-argument
				;;
    
		esac
	done

	if [ $RELOAD_i3 -eq 0 ] ; then
		i3-msg reload > /dev/null 2>&1
		i3-msg restart > /dev/null 2>&1
	fi

	exit 0
}

dotman-help () 
{
	echo "Utility for managing linux config files."
	echo
	echo "USAGE:"
	echo "    dotman [OPTION]... <COMMAND>..."
	echo
	echo "OPTIONS:"
	echo "    -h, --help             Prints this help message and exits"
	echo
	echo "COMMANDS:"
	echo "    init                   Init the utility and dotfiles repo"
	echo "    config                 Configurations settings"
	echo
	echo "For more info contact me: adi.pop.bv@gmail.com"

	exit 0
}

dotman-invalid-argument ()
{
	echo "No such argument. Run with 'dotman --help' for more info."
	exit 1
}

dotman ()
{
	if [ $# -eq 0 ] ; then
		echo "No argument given. Run with 'dotman --help' for more info."
		exit 0
	fi

	while [ $# -gt 0 ] ; do
		case $1 in
			-h|--help)
				shift
				dotman-help
				;;
	
			init)
				shift
				init
				;;
	
			config)
				shift
				config $@
				;;
	
			*)
				shift
				dotman-invalid-argument
				;;
	
		esac
	done

	exit 0
}

echo
dotman $@

