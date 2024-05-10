# Portage commands

## Update system:
- Sync external repository (gentoo-sources, ecc...):
``` shell 
sudo emerge --sync
```
- Update and update after change USE flags:
``` shell 
sudo emerge -avtDUu @world
```

## Install Package
``` shell
sudo emerge --ask package-group/PackageName
```

## Remove Package
``` shell
sudo emerge --ask --depclean package-group/PackageName
```
After removing a package:
``` shell
sudo emerge --ask --depclean
```

## Kernel upgrade
#### If there is a new version of the kernel:
- Update the system to install the new gentoo-sources
- Change the symlink to the new kernel with:
    ``` shell
    eselect kernel list
    sudo eselect kernel set #number
    ```
- Copy the old configuration in the new folder:
    ``` shell
    sudo cp /usr/src/linux-...old-version...-gentoo/.config /usr/src/linux/
    ```
- Update the config interactly:
    ``` shell
    cd /usr/src/linux/
    sudo make oldconfig
    ```
    will ask the configuration for the new module in the Kernel

#### This part is useful also for changing the Kernel configuration: 
- Configure the Kernel:
    ```shell
    cd /usr/src/linux
    sudo make menuconfig
    ```

- Setting the Kernel and then build the kernel and the modules:
    ```shell
    sudo make -j8 modules_prepare
    sudo make -j8
    sudo emerge --ask @module-rebuild
    ```
    In case of only changing Kernel setting is enough:
    ``` shell
    sudo make -j8 
    ```

- Install the kernel and the modules:
    ``` shell 
    sudo make -j8 modules_install
    sudo make -j8 install
    ```

- If necessary update the Bootloader:
    ``` shell
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    ```

- To verify the driver installed:
    ``` shell
    lsmod
    ```
    - For Nvidia:
        ```shell
        lsmod | grep nvidia
        ```
        - Reload the module:
            ``` shell 
            rmmod nvidia
            modprobe nvidia
            ```
        - Verify Direct Rendering is enabled:
            ```shell
            glxinfo | grep direct
            ```
#### Clean old Kernel
If you wont to remove the old sources:
``` shell
sudo emerge --ask --depclean
```

## USE Flags
In general write a flag wit a `-` before means to remove that specific USE flags.

### Global USE flags
This flags will be used on all Package installed. They are set in the variable `USE` in `/etc/portag/make.conf`:
``` config
USE='-flags1 -flags2 flags3 flags4 ...'
```

### Local USE flags 
They are used only in a specific package.

The USE flags are setted in the folder `/etc/portage/package.use/`. Good habits:
- Create a new file for each different package with the name of the package
- Write even the USE flags of the dependency package in the same file
- Comment all the package write in each file with `#`

The structure will be: (in directory: `/etc/portage/package.use/PackageName`)
``` config
# This is a comment 
package-group/PackageName -useflags1 useflags2 useglags3 ...
```

To see a package USE flags:
``` shell
emerge --nodeps --pretend PackageName
```

### Update USE flags
After changing some use flags in some package, update with:
``` shell
sudo emerge -avtDUu @world
```

## Package Licence


## Package Mask 


## Package Versioning

