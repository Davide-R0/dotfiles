# Espressif modules installation
...

## Add some kernel modules to linux
[kernel modules](https://wiki.gentoo.org/wiki/Arduino#Arduino_NG_.28FTDI.29)

## Add user to serial access
`sudo gpasswd -a $USER dialout`

## Install FTDI driver for usb converter FT232RL
...

## Serial port comunication
### Install a serial port comunication CLI program
`sys-apps/setserial` to found the serial port.

Search for serial device: `sudo setserial -g /dev/ttyS[0123]` (to see all the serial port *tty*: `ls /dev/tty*`)

`net-misc/putty` or `net-dialup/minicom` to read serial port.

To setup *minicom* `minicom -s`. Setup saved in `/etc/minicom/...`

For more esp tool: `dev-embedded/esptool` (needed???)

Serial monitoring even with esp `idf.py -p Port monitor` tool.

## Project sourcing
Source the envoirement *idf*, using an alias: `alias get_idf='. $HOME/Code/esp/esp-idf/export.sh'`, write `get_idf` to use the `idf.py --help` tool.

## Create a new empty project
Creation of a project in a `nameProject` directory: `idf.py create-project maneProject`.



More information:
``` shell 
man dmesg
man setserial
man screen
```
