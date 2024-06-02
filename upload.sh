############# X11 ###############
cp ~/.xinitrc X11/config/
echo "X11 uploaded!"
############# bash ###############
cp ~/.bashrc bash/config/
echo "bash uploaded!"
############# i3 ###############
cp ~/.config/i3/config i3/i3-config/
echo "i3 uploaded!"
############ nvim ##############
cp -r ~/.config/nvim/. nvim/config/
echo "nvim uploaded!"
############ picom ##############
cp -r ~/.config/picom/. picom/config/
echo "picom uploaded!"
############ polybar #############
cp -r ~/.config/polybar/. polybar/config/
echo "polybar uploaded!"
############# rofi ##############
cp ~/.config/rofi/config.rasi rofi/config/
echo "rofi uploaded!"
############# tmux ##############
cp -r ~/.config/tmux/tmux.conf tmux/config/
echo "tmux uploaded!"
############ xterm ##############
cp ~/.Xresources xterm/config/
echo "xterm uploaded!"

