# Linux comands cheatsheet

## About

Did you ever forgot how to add a new font to your install? Did you ever forgot how to mount an android device to view files? Well with this cheatsheet you will never have to remember that, just look here for the info!

## Contents

- [About](#about)
- [Contents](#contents)
- [Video and display](#video-and-display)
- [Fonts](#fonts)
- [Files and directories](#files-and-directories)
- [Package manager](#package-manager)
- [Pointing devices](#pointing-devices)
- [Quality of life](#quality-of-life)

## Video and display

### Display on HDMI output

HDMI = `xrandr` + get the hdmi option  
`xrandr --output` HDMI `--mode 1920x1080 --rate 144`

> That does not work? Check to see if in hybrid or nvidia mode. If not, switch to one of them

### Get the class name of a window

`xprop` and click on the window  
Check the entry named `WM_CLASS(STRING)`

## Fonts

### Reload fonts cache

`fc-cache -f -v`

### Add a new custom font

Get the font you want as a `.ttf` file and add it to the `~/.fonts` directory, then [reload](#reload-fonts-cache) the fonts

### Add icons as characters

Get some icon fonts such as `material design` and `awesome font` and add them to your install. To use them, search online for cheatsheets and copy-paste the character itself from the cheatsheet

## Files and directories

### Mount and use an android device

On the mobile device make sure you are set to the `file transfer` mode and leave the screen open.  
`aft-mtp-mount ~/mnt` and then surf your freshly mounted mobile device  
`fusermount -u ~/mnt` to safely unmount the mobile device after you ade done with it

## Package manager

### error: failed to commit transaction (conflicting files)

`pacman -S --overwrite "*" package-name`

### error: one or more pgp signatures could not be verified!

`gpg --receive-keys A1B2C3D4E5F6A7B8` (insert your key from the error message)

## Pointing devices

### Universal

#### Swap pointer buttons

`xmodmap -pp` to see pointer buttons definitions

`xmodmap -e "pointer = 1 6 3 4 5 2"` to assign middle click to button 6

### Mouse

#### Disable middle button paste

`xmousepasteblock`

### Touch pad

#### Set touch click

`exec xinput set-prop $(xinput list | grep -i "touchpad" | awk '{print $6}' | grep -o "[0-9][0-9]") $(xinput list-props $(xinput list | grep -i "touchpad" | awk '{print $6}' | grep -o "[0-9][0-9]") | grep -i "tapping enabled (" | awk '{print $4}' | grep -o "[0-9][0-9][0-9]") 1`

#### Set natural scrolling

`exec xinput set-prop $(xinput list | grep -i "touchpad" | awk '{print $6}' | grep -o "[0-9][0-9]") $(xinput list-props $(xinput list | grep -i "touchpad" | awk '{print $6}' | grep -o "[0-9][0-9]") | grep -i "natural scrolling enabled (" | awk '{print $5}' | grep -o "[0-9][0-9][0-9]") 1`

#### Set cursor speed

`exec xinput set-prop $(xinput list | grep -i "touchpad" | awk '{print $6}' | grep -o "[0-9][0-9]") $(xinput list-props $(xinput list | grep -i "touchpad" | awk '{print $6}' | grep -o "[0-9][0-9]") | grep -i "accel speed (" | awk '{print $4}' | grep -o "[0-9][0-9][0-9]") 0.60` 

## Quality of life

### Better man pages

`tldr` - short and concise explanations for commands with examples

### Assistant in the terminal

`tuxi` - internet answer searcher. Like google assistant but less complex
