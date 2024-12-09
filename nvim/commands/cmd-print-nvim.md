-SCENE_TAG tag, scene* sceneinserire le segunti righe nel file init.vim:
  "prnter setup
  nnoremap <leader><leader><leader>pp :r !echo; lpstat -p \| sed 's/printer //g' \| sed 's/i
  nnoremap <leader><leader><leader>ph :w<cr>:!lpoptions -d HP_Smart_Tank_7000<cr>:!lp -n 1 -
-il primo comando si inserisce con \\\pp e serve per vedere le stampanti disponibili (poi da inserire quella che si vuole nel secondo comando)
-i comandi inseriti significano: 
    :w<cr> saves the file.
    ! indicates the start of the shell command.
    -d HP_LaserJet_2200_LOCAL_hpcups is the destination printer and it's name. Choose your own printer from the list you have generated above.
    -n 1 indicates one copy only.
    -o media=a4 indicates the paper size.
    -o sides=two-sided-long-edge indicates double sided printing and long edge selection. Other available options that can be used, which may be useful to you are, -o sides=one-sided, -o sides=two-sided-long-edge, -o sides=two-sided-short-edge
    % indicates print the current file. Has to be saved to work.
    <cr> at the end executes it without an extra manual carridge return inside nvim.

