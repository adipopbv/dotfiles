# Fresh install

This document contains steps needed to be done to make the install ready to go (most stuff is allready set up in config files, but some commands need to be run).

## Steps for dotman

- install git
- clone dotfiles git repo
- install packages
- create `current-config`
- symlink configs to `current-config` files
- set user groups (sudo, wheel, input etc.)
- make pacman and yay output color
- generate ssh key

## Stuff to setup:

- login shell (bash)
- windowing system (x11)
- window manager (awesome)
- terminal emulator (kitty)
- interactive shell (hilbish)
- web browser (firefox)
- text editor (neovim)
- file explorer (ranger)
- audio (alsa, pipewire-pulse, pavucontrol)
- file systems (gnome-disks)
- authentication agent (polkit, polkit-gnome)
- fingerprint (fprintd, python-validity)
- monitoring (htop, vtop, nvtop, radeontop)
- hibernation (btrfs)
- function keys (xbindkeys)
- bluetooth (bluez, bluez-utils)
- battery (tlp, tpacpi-bat)
- fonts (fc-cache)
- touchpad (fusuma)
- backup (snapper)

- ui & ux customizations

### Login shell

Setup Bash

- setup configurations

### Windowing system

Setup X11

- setup configurations
- start from login shell config

### Window manager

Setup Awesome

- setup configurations
- start from windowing manager config

### Terminal emulator

Setup Kitty

- setup configurations

### Interactive shell

Setup Hilbish

- setup configurations

### Web browser

Setup Firefox

- login to account
- wait for sync
- login to bitwarden and other extensions

### Test editor

Setup Neovim

- install VimPlug
- install plugins

### File explorer

Setup Ranger

- setup configurations
- setup drag-and-drop
- setup image previews

### Audio

Using PipeWire

If audio is too low, enter alsamixer to raise sound.

### File systems

Setup external drive

- edit fstab to mount the external drive

### Authentication agent

Setup polkit

- start polkit-gnome-authentication-agent-1 from login shell config

### Fingerprint

Setup fingerprint unlock
(If the service crashes after suspend/hibernation, restart `open-fprintd-resume` and `-suspend` services)

- use python-validity package as driver
- modify configs in `/etc/pam.d` to ask for fingerprint unlock when loging in and using sudo (and other stuff if needed)
- setup fingerprints with `fprintd-enroll`

### Hibernation

Setup hibernation

- setup swap file (create and swap on)
- add init hook and kernel params (add resume hook to initramfs and device path and offset to kernel params)

### Function keys

Set audio inc and dec, brightness inc and dec, ...

- use xbindkeys and acpid to bind keys to actions (start from window manager config)
- use pamixer to control audio actions
- use xbacklight to control screen brightness
- use setxkbmap to control keyboard layout
- use gnome-screenshot to perform screen shot

(you might need to add `options snd-hda-intel model=thinkpad` to `/etc/modprobe.d/mute-led.conf`)

### Bluetooth

Setup bluetooth

- turn on `bluetooth` service
- pair and connect devices with `bluetoothctl`

### Battery

Set charge limit for thinkpad laptop

- modify tlp config

### Fonts

Install fonts

- gnu-free-fonts for most apps
- `fc-cache` to reload fonts

### Touchpad

Touchpad configuration

- use `fusuma` to assign gestures to hotkeys
- copy and configure `/usr/share/X11/xorg.conf.d/70-synaptics.conf` to `/etc/X11/xorg.conf.d/`

### UI & UX Customizations

#### Spotify

Packages: `spotify-launcher`, `spicetify-cli` and `spicetify-themes-git`

- set theme with command

