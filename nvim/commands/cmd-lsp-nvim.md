# Completion commands
- `<C-p>` (in insert mode): toggle lsp
- `<C-j>` or `<C-k>` : up or down in lsp selection
- `<C-n>` : select the lsp
- `<C-space>` : complete lsp 
- `<C-e>` : abort lsp completion

# LSP commands
Diagnostic in normal mode (to see the full error in inline error):
- `<space>e`: open diagnostic
- `[d` `]d`: go tu next/previus element in diagnostic
- `<space>q`: quit diagnostic

In normal mode:
- `gD`: go to declaration of lsp (come si torna indietro??)
- `gd`: go to definition of lsp
- `K`: information of lsp (two time to pas the cursor)
- `gi`: implementation ????
- `<space>wa` `<space>wr` `<space>wl`: add/remove/see workspace folder ????
- `<space>D`: go to type definition
- `<space>rn`: rename ????
- `gr`: see reference of the lsp in the document
- `<space>f`: format (do not use)
In visual and normal mode:
- `<space>ca`: code action ????
