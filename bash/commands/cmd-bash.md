# Useful keybindings for Bash

## Line movement:
- `ctrl+a`  Move cursor to the beginning of the line (home).
- `ctrl+e`  Move cursor to the end of the line (end).
- `ctrl+f`  Move the cursor forward one character.
- `ctrl+b`  Move the cursor back one character.
- `alt+f`   Move cursor forward one word.
- `alt+b`   Move cursor backward one word.
- `ctrl+xx` Toggle the cursor between the current position and the beginning of the line.
- `ctrl+]-<char>`       Move cursor to the first occurrence of the entered character to the right.
- `ctrl+alt-]-<char>`   Move cursor to the first occurrence of the entered character to the left.

## Directory movement:
- `cd /path`    Change to /path directory.
- `cd -`        Change to previous directory.
- `cd`          Change to home directory.

## Screen control
- `ctrl+s`  Stop (pause) output on the screen.
- `ctrl+q`  Resume output on the screen (after stopping it with the previous command).
- `ctrl+l`  Clears the screen preserving the current command (very similar to the clear command).


## Deletion:
- `ctrl+u`  Remove text relative to the cursor's current position to the beginning of the line.
- `ctrl+k`  Remove text relative to the cursor's current position to the end of the line.
- `alt+d`   Remove one word moving forward from the cursor's current position.
- `ctrl+w`  Remove one word moving backward from the cursor's current position.
- `ctrl+y`  Paste deleted text.

## Command history
- `ctrl+p`  Scroll backward through previous command history for the current session.
- `ctrl+p`  Scroll forward through next entry in command history for the current session
- `ctrl+r`  Reverse search through history (type parts of the command to initiate query).
