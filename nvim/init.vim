"---------------------------------------------------
" (N)Vim Configuration File
" nvim : place in $HOME/.config/nvim/init.vim
" $ ln -s $HOME/.config/nvim/init.vim $HOME/.vimrc
" --------------------------------------------------

"nota che tutti i file lua DEVONO essere messi all'interno di una cartella .config/nvim/lua


lua require('options')
lua require('keymap')
"filetype plugin indent on

set clipboard+=unnamedplus

set signcolumn=auto:1

" number of lines at the beginning and end of files checked for file-specific vars
"set modelines=0

" reload files changed outside of Vim not currently modified in Vim (needs below)
"set autoread

" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
"au FocusGained,BufEnter * :silent! !

" make scrolling and painting fast
" ttyfast kept for vim compatibility but not needed for nvim
"set ttyfast lazyredraw

" http://vim.wikia.com/wiki/Searching
"set hlsearch incsearch ignorecase smartcase

" As opposed to `wrap`
"set nowrap

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
"set autochdir

" open new buffers without saving current modifications (buffer remains open)
"set hidden

" http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
"set wildmenu wildmode=list:longest,full

"lua require('~/.local/share/nvim/plugged/prova-plugin')

"
" -----------vim-plug----------- "
" https://github.com/junegunn/vim-plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
" Install with `:PlugInstall`

"Per la linea sotto https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'
Plug 'feline-nvim/feline.nvim' "(alternative)
" Per lualine
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'

" Per tab line
Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
"Plug 'romgrk/barbar.nvim'

" https://github.com/tpope/vim-commentary
" For automatic commentingo of line or paragraph
Plug 'tpope/vim-commentary'

" https://github.com/tpope/vim-surround
" Per virgolette ecc.. automatiche
"Plug 'tpope/vim-surround'

" https://github.com/tpope/vim-vinegar
" For more option in Netrw envoirement
Plug 'tpope/vim-vinegar'

" https://github.com/APZelos/blamer.nvim
" For see last change in git repository 
Plug 'APZelos/blamer.nvim'

" Some colorscheme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } "(optional)
Plug 'fenetikm/falcon' "(optional)
Plug 'morhetz/gruvbox'

" https://github.com/nvim-telescope/telescope.nvim
" Telescope plugin
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
" Media preview supporting
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

"https://github.com/nvim-treesitter/nvim-treesitter
" Hilighting of different programming linguage
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" https://github.com/hrsh7th/vim-vsnip
" For snippets: vsnip 
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" For VScode snippets
"Plug 'golang/vscode-go'

"undoo tree
Plug 'mbbill/undotree'

" https://github.com/prabirshrestha/vim-lsp
" LSP Plugin  (in più rispeto a quello sotto
"Plug 'prabirshrestha/vim-lsp'
" https://github.com/mattn/vim-lsp-settings
" For easy server installation  (:LspInstallServer)
"Plug 'mattn/vim-lsp-settings'   " non necessario

" https://github.com/hrsh7th/nvim-cmp
" Completion and lsp Plugin
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

"fortrain
"Plug 'rudrab/vimf90'
"latex preview    per avviare lapreview :LLPStartPreview  
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"usare questa libreria \usepackage[backend=bibtex]{biblatex} per la bibliografia
Plug 'lervag/vimtex'
"Plug 'jakewvincent/texmagic.nvim'
"
"markdown preview (install nodejs and yarn)
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

" Git plugin
Plug 'lewis6991/gitsigns.nvim'

"startup page
Plug 'mhinz/vim-startify'
" End plugin system

" Plug 'preservim/nerdtree'
" Icons
Plug 'ryanoasis/vim-devicons'


"Git diff
Plug 'sindrets/diffview.nvim'

"openscad
Plug 'salkin-mada/openscad.nvim'

"AI ollama
Plug 'David-Kunz/gen.nvim'
"Per telescope
Plug 'nvim-telescope/telescope-ui-select.nvim'

"Grammar tool
"Plug 'dpelle/vim-LanguageTool'
call plug#end()

" ------Configuration Files------- "

lua require('plug.gen')
lua require('openscad')
lua require('plug.openscad')


" vimtex configuration file
lua require('plug.vimtex_conf')

" Telescope configuration file
lua require('plug.telescope.telescope_conf')

" Install clangd per c/c++
" Let clangd fully control code completion
"let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
"let g:ycm_clangd_binary_path = "/usr/bin/clangd"
" exepath("clangd")

lua require('gitsigns').setup()
set statusline+=%{get(b:,'gitsigns_status','')}

lua require('lualine').setup({options = { theme = 'gruvbox' }})
"lua require('barbar').setup({ auto_hide = 0 })

" Lsp Server configuration file (in più oltre a quello sotto)
lua require('plug.lsp_conf')

" Completion configuration file
lua require('plug.cmp_conf')

" Vsnip Configuration file
lua require('plug.vsnip_conf')
let g:vsnip_snippet_dir = "/home/davide/.config/nvim/snippets/" "directory for snippets

lua require('plug.clangd')

"lua require('plug.undotree')

" DEVE stare dopo i plugin
colorscheme gruvbox
set background=dark    " Setting dark mode

" For spelling checking
"set spell
nnoremap <leader>it :setlocal spell spelllang=it <cr>
nnoremap <leader>en :setlocal spell spelllang=en <cr>

" For Vexplore
nnoremap <leader><leader>f :Vexplore <cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""


" Show character column
"""""""""""""""""""""set colorcolumn=0
"hi ColorColumn cterm=none gui=none guibg=white ctermfg=white

let g:blamer_enabled = 1  
" %a is the day of week, in case it's needed
let g:blamer_date_format = '%e %b %Y'
"highlight Blamer guifg=darkorange

"prnter setup
nnoremap <leader><leader><leader>pp :r !echo; lpstat -p \| sed 's/printer //g' \| sed 's/is idle.  enabled since.*//g'; echo<cr>
nnoremap <leader><leader><leader>ph :w<cr>:!lpoptions -d HP_Smart_Tank_7000<cr>:!lp -n 1 -o media=a4 -o sides=two-sided-long-edge %<cr><cr>

"netrw config
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_winsize = 15
"Per avere la barra automaticamente aperta
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
let g:netrw_keepdir=0

"Remove background in window
hi Normal guibg=NONE ctermbg=NONE
hi NormalFloat guibg=NONE ctermbg=NONE
hi FloatBorder guibg=NONE ctermbg=NONE
