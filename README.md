# .dotfiles

Dotfiles and system configuration for GNU/linux 

There will be even a basic usage explanation of all the tools.

> There are still many things to fix.

The *config* of programs not used are in `programs/` folder. A list of other useful general programs are in the `README.md` of the same folder.

## Gentoo
Basic kernel and portage configuration for:

Kernel:
- Nvidia GPU and Nvidia driver
- Nvme ssd
- bluetooth usb
- AMD cpu
- cabled internet
- ...

Portage:
- Global use flags
- Nvidia driver
- amd architecture (2°-3° gen ?)
- ...

## X11
Display manager.
``` bash 
~/.xinitrc
```

## i3
Window manager.

``` bash 
~/.config/i3/.
```

## picom - compton
Compositer for window. 

Better Picom (fork of compton) then Compton. Picom allow round window corner.

### Picom 
``` bash 
~/.config/picom/.
```
### Compton
``` bash 
~/.config/conpton/compton.conf
```

## Polybar - i3-bar
i3 status bar with system monitoring tool. 

Better Polybar then i3-bar.

### Polybar 
``` bash 
~/.config/polybar/.
```

### i3-bar
``` bash 
~/.config/i3/i3status.conf 
```

## Rofi - dmenu
i3 menu searcer. 

Better Rofi then dmenu.

### Rofi 
``` bash 
~/.config/rofi/.
```
### dmenu 
Default i3 menu. 

## Terminal Emulator (to upgrade with xterm o rxvt-unicode)
Terminal emulator.

### Xterm
``` bash 
~/.Xresources
```

### Kitty
``` bash 
~/.config/kitty/.
```

### Terminator
Using the default GUI theme customizer

## Terminal 
### Bash
``` bash 
~/.bashrc
```

### Zsh 
Terminal highly customizable. Powerlevel 10k personalization.

#### Zsh 
``` bash 
~/.zshrc
```
#### p10k
Using `p10k configure` in shell.

## Tmux
Terminal multiplexer

``` bash 
~/.config/tmux/.
```

## Neovim
All in one text editor.

``` bash 
~/.config/nvim/.
```
And plugin intsalled in `~/.local/share/nvim/.`

## Userfull programm
See [program](programs/README.md) for a list.
