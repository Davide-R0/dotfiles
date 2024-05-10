# Tmux commands
tmux can be controlled from an attached client by using a key combination of a prefix key stroke (`Ctrl+b` by default) followed by a command key.

After pressing `Ctrl+a` (default: `Ctrl+b`) the following key combinations can be used:

## General
`?` = List all key bindings.
`d` = Detach the current client.
`:` = Enter the tmux command prompt.

## Creating and managing windows

`c` = Create a new window

`n` = Change to the next window.

`p` = Change to the previous window.

`l` = Move to the previously selected window.

`0-9` = Select windows 0 to 9.

`'` = Prompt for a window index to select. Then enter a number or title to switch to that window.

`,` = Rename the current window.

`w` = Choose the current window interactively.

`:`, then type `list-windows` and press `enter` = Display the list of windows.

## Creating and managing panes

`"` = Split the current pane into two, top and bottom.

`%` = Split the current pane into two, left and right.

`o` = Select the next pane in the current window.

`Arrow Key` = Move betwen panes 

`;` = Move to the previously active pane.

`{` = Swap the current pane with the previous pane.

`}` = Swap the current pane with the next pane.

`Ctrl+o` = Rotate the panes in the current window forwards.

`Alt+1` to `Alt+5` = Arrange panes in one of the five preset layouts: even-horizontal, even-vertical, main-horizontal, main-vertical, or tiled.

`x` = Kill the current pane.

`!` = Break the current pane out of the window.

## Copy, paste, and scroll operations

The keys available depend on whether emacs (default) or vi mode is selected. The mode-keys option can be set in .tmux.conf for vi mode.

`[` = Enter copy mode to copy text or view output history via the scrollback buffer. Once in copy mode, pressing j or k will move the cursor down or up lines respectively, while { and } will move down or up on in per-paragraph chunks.

`]` = Paste the most recently copied buffer of text.

`#` = List all paste buffers.

`-` = Delete the most recently copied buffer of text.

## Session control 

`d` = Detach from a session (or simply close th terminal)

`D` = See active session to attach


From terminal: 

Create new session: `tmux` or `tmux new -s sessionName`.

List session: `tmux ls`

Attach a session: `tmux a -t #` (con `#` un numero)


