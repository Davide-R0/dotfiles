# Varius userfull program for GNU/linux
Mirates for Gentoo system, in each folder ther will be a userful `package.use` file for portage and other information.

- CLI = command line strument
- GUI = user interface strument

Order of preference

## Web browser
1. qutebrowser (Vim keybindings, GUI)
2. brave, brave-bin (Gentoo, GUI)
3. elinks (CLI)

## File manager
1. nnn (CLI)
2. spaceFm (GUI)

## Image view
Both userfull:
- feh (CLI)
- ImageMagick (CLI)

## Document viewer (pdf, epub, ecc...)
- zathura (Vim keybindings, CLI)

## Writing tool
Both userfull:
- Neovim (CLI)
- Obsidian (userfull for *md* vault, GUI)

## Backgrounds
1. feh (CLI)
2. Nitrogen (more immediate then feh,, GUI)

## Customization
Dipending by wich program you use:
- lxappearance (with GUI)

## Audio and Audio player
- PulseAudio (audio manager with GUI)
- MPD audio server

CLI player:
1. NCMPCPP (CLI)
2. MOC (CLI) (it require an older version of ffmpeg and cause a lot of problems)

## Video player
1. mpv (CLI)
2. vlc (GUI)

## Programming tool
- clang: for c, cpp
- python
- ...

## 3D modelling
1. OpenSCAD (CLI, with nvim plugin)
2. Blender

## System monitoring tool
- htop (CLI, for cpu)
- nvtop (CLI, for gpu)

## Printer
- Ultimeker Cura (GUI 3D printing)
- cupid (for all normal printer)

## Nvidia GPU Driver
1. Nvidia propetary driver
2. Nouveau opensource driver

## Calendar
1. calcurse (CLI)

## Notification
- Not done (yet?)

## Local AI
(Raccomanded >=16Gb RAM, >=4Gb VRAM Nvidia GPU, 4>=core >=4Ghz CPU, nvidia driver)
- Ollama with Mistral 7B: general purpose AI chat
- Fooocus: AI images generator
- PrivateGPT: local document (pdf) learner AI chat (with Ollama Mistral 7B + ebbeddings tool)
- Ollama implementation with Neovim (*Gen* plugin)
- NeRF with Nerfstudio: render 3D model from 2D video 
- neuralangelo: render 3D model from 2D video 

## Root CERN
C++ data analysis tool.

## YouTube music downloader
- yt-dlp

## Copy-Paste utility
- XClip

## Rescue deleted files
Use `testdisk`.
Open it, select the hardisk and choose the partitioning system, select `advanced` settings and then select the box `undelete`. Then copy the deleted file where you want.

