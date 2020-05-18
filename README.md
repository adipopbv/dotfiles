<h1 align="center">
    <img src=".github/pictures/dotfiles-title-ascii.png" align="center" height="200px">
	<br>
	<strong><font size="5">
		adipopbv's dotfiles
	</font></strong>
	<p align="center"> 
		<img src="https://img.shields.io/github/license/adipopbv/dotfiles?style=flat-square">
		<img src="https://img.shields.io/github/issues/adipopbv/dotfiles?style=flat-square">
		<img src="https://img.shields.io/github/issues-pr/adipopbv/dotfiles?style=flat-square">
		<img src="https://img.shields.io/github/stars/adipopbv/dotfiles?style=flat-square">
		<img src="https://img.shields.io/badge/distro-Pop!__OS-48b9c7?style=flat-square">
	</p>
</h1>

<h2 align="center"><i> Welcome to my (currently not so) charming dotfiles stash! </i></h2>

## Table of Contents:

- [Intro](#intro)
- [About](#about)
	- [Operating System](#operating-system)
	- [Notable Software](#notable-software)
	- [Dotman](#dotman)

## Intro

_Welcome friend... Welcome..._ This right here are the dotfiles for my Pop!_OS install.

Here you can find also some useful scripts and utilities I made and found across the internet. Check out each config's __scripts__ directory for them.

#### What the ... is a dotfile?!

Well, to explain better, I have to go back in time. Bun not too much. Let me tell you a little story...

Once upon a time there was an operating system being developed: __UNIX__. Because in the unix world the current directory is `.` and the previous one is `..`, in an attempt to avoid listing them, all files starting with a __dot__ in front of the name were ignored, thus becomming hidden.

One day a user showed up and he wanted to have his apps behave in the way he wanted, so the mighty devs said:   
> Very well, you shall have means for customizing them apps.

So they made the settings of the apps accessible from files in each user's home directory and because they were so many, they were made hidden, not to disturb the user.

_The end!_

So basicaly a dotfile is a setting file for a program.

#### Disclaimer...

- I want to say that I am new to this whole dotfiles stuff and even linux.
- I know it's not perfect but I guess it's a good enough start.
- I am always open to suggestions but I might not have enough time to look into some stuff.
- I plan to add more stuff when I have more time, but for now this is all I got.

## About

#### Operating System:

Well, __Linux__ of course!   
Ahem... excuse me; __*GNU/Linux*__.   
__Pop!\_OS__ to be more specific. For now I plan to stick with it but I guess I'll be migrating to an __Arch__ based one, or maybe to __Void__. Who knows...

#### Notable software:

For now, some of the most important software I made custom configs for are the following:   
| Category | Program |
| --- | --- |
| Compositor | [compton](https://github.com/tryone144/compton) (tryone fork) |
| Notifications | [dunst](https://github.com/dunst-project/dunst) |
| Version Control | [git](https://github.com/git/git) |
| Window Manager | [i3-gaps](https://github.com/Airblader/i3) |
| Terminal Emulator | [kitty](https://github.com/kovidgoyal/kitty) |
| File Editor | [neovim](https://github.com/neovim/neovim) |
| Status Bar | [polybar](https://github.com/polybar/polybar) |
| File Explorer | [ranger](https://github.com/ranger/ranger) |
| App Launcher | [rofi](https://github.com/davatorium/rofi) |
| Terminal Shell | [zsh](https://github.com/zsh-users/zsh) |
| Hotel? | [trivago](https://www.youtube.com/watch?v=dQw4w9WgXcQ) |

#### Dotman:

So... Let me explain my mentality.

- My dotfiles repo is like an archive of multiple `configs`, located in the `configs` dir.   
	- Each `config` is basicaly a dir with configuration files for some programs.
	- There can be any number of `configs`, each with different programs, colorschemes, bindings etc.
- I have a `current-config` dir which has the currently stored config files, symlinked to the required dirs.
	- The `current-config` is separated from all other `config`, it is a stand-alone configuration.

Here does the mighty __Dotman__ utility come in.
- Dotman is taking care of customizations management.
	- It can list avalilable configs
	- It creates new configs from the current one
	- It sets configs
	- And for now that's all...
