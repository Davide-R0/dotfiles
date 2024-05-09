# Kitty

For best compatibility use hack font:
``` shell
sudo emerge --ask media-fonts/hack
```

then reload the font cache: `fc-cache -f -v`

## Configuration
Config in:
``` shell
~/.config/kitty/kitty.conf 
```


## Keybindings
New tab: `Ctrl+Shift+t`

Close tab: `Ctrl+Shift+q`

Next tab: `Ctrl+Shift+right`

Previous tab: `Ctrl+Shift+left`

Next layout: `Ctrl+Shift+l`

Move tab forward: `Ctrl+Shift+.`

Move tab backward: `Ctrl+Shift+,`

Set tab title: `Ctrl+Shift+Alt+t`

Start Unicode search: `Ctrl+Shift+u`

## Default setting
Put in .profile (or maybe even in `.bashrc` or `.xinitrc`?):
``` shell
export TERMINAL=kitty 
```
and reboot the system.

## Feature

### Various
There are some theme preset, to visualize insert: `kitten themes`

Kitty diff view: `kitten diff file1 file2` (even with images) (in .bashrc `alias kdiff="kitten diff"`)

Cat: `kitten icat image.jpeg` (in .bashrc `alias kcat="kitten icat"`)

Hint: see the website

### In SSH computer can easily open or download files:
- In the ssh terminal connection insert `ls --hyperlink=auto`
- Hold `Ctrl+Shift` and press the file you wont
- You can chose

### Transfer files on SSH or other connection:
- Copy form the remote computer:
    ``` shell
    <local computer>  $ kitten ssh my-remote-computer
    <remote computer> $ kitten transfer some-file /path/on/local/computer
    ```

- Copy on local computer:
    ``` shell
    <local computer>  $ kitten ssh my-remote-computer
    <remote computer> $ kitten transfer --direction=upload /path/on/local/computer remote-file
    ```

### SSH integration:
- Automatic Shell integration on remote hosts
- Easily clone local shell/editor config on remote hosts
- Automatic re-use of existing connections to avoid connection setup latency
- Make the kitten binary available in the remote host on demand
- Easily change terminal colors when connecting to remote hosts
- Automatically forward the kitty remote control socket to configured hosts

To connect on ssh with kitty: `kitten ssh some-hostname-to-connect-to` (on .bashrc `alias kssh='kitten ssh'`)

(You can map `F1` key to open automaticaly another tab: `map f1 new_window_with_cwd`) 

SSH can be configured in `~/.config/kitty/ssh.conf`:
- Example:
    ``` conf
    # Copy the files and directories needed to setup some common tools
    copy .zshrc .vimrc .vim
    # Setup some environment variables
    env SOME_VAR=x
    # COPIED_VAR will have the same value on the remote host as it does locally
    env COPIED_VAR=_kitty_copy_env_var_
    
    # Create some per hostname settings
    hostname someserver-*
    copy env-files
    env SOMETHING=else
    
    hostname someuser@somehost
    copy --dest=foo/bar some-file
    copy --glob some/files.*
    ```

### Query
`kitty +kitten query_terminal [options] [query1 query2 ...]`

### Kitty Control
See website

### Shell integration 
- Open the output of the last command in a pager such as less (ctrl+shift+g)
- Jump to the previous/next prompt in the scrollback (ctrl+shift+z / ctrl+shift+x)
- Click with the mouse anywhere in the current command to move the cursor there
- Hold Ctrl+Shift and right-click on any command output in the scrollback to view it in a pager
- The current working directory or the command being executed are automatically displayed in the kitty window titlebar/tab title
- The text cursor is changed to a bar when editing commands at the shell prompt
- Clone the current shell into a new window with all environment variables and the working directory copied
- Edit files in new kitty windows even over SSH
- Glitch free window resizing even with complex prompts. Achieved by erasing the prompt on resize and allowing the shell to redraw it cleanly.
- Sophisticated completion for the kitty command in the shell.
- When confirming a quit command if a window is sitting at a shell prompt, it is not counted (for details, see confirm_os_window_close)

### Potrebbero esserci dei problemi con tmux
