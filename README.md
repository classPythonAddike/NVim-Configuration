# NVim-Configuration
This repository contains my NeoVim-configurations. Please note, that a lot of the code in my [init.vim](/init.vim) is take from the documentation, and from [@Binx's init.vim](https://github.com/Binx-Codes/NeoVim-config) (which has changed a lot now). Also, I primarily use Neovim for Golang and Vue Projects, so a lot of my configurations are centered towards those two languages.

## Plugins Used

1. Syntax Support: [vim-polyglot](https://github.com/sheerun/vim-polyglot)
 
2. File Explorer: [NERDTree](https://github.com/scrooloose/NERDTree)

3. Highlighting Files in the Explorer: [vim-nerdtree-syntax-highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)

4. File Icons in the Explorer: [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)

5. Show Git status in the Explorer: [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)

6. Auto pairs for '(' '\[' '{', etc: [auto-pairs](https://github.com/jiangmiao/auto-pairs)

7. Themes: [gruvbox-material](https://github.com/sainnhe/gruvbox-material) and [onedark](https://github.com/joshdick/onedark.vim)

8. Language Servers: [coc](https://github.com/neoclide/coc.nvim)

9. Status Line (and File Tabs): [vim-airline](https://github.com/vim-airline/vim-airline)

10. Themes for the Status Line: [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)

11. Go Support: [vim-go](https://github.com/fatih/vim-go)

12. Vue Syntax Highlighting: [posva/vim-vue](https://github.com/posva/vim-vue)

13. Autoclose HTML Tags: [alvan/vim-closetag](https://github.com/alvan/vim-closetag)

Other than these, I also use two plugins with Coc, which are not listed in my [init.vim](/init.vim) -
1. [coc-go](https://github.com/josa42/coc-go): For the Gopls language server
2. [coc-cord](https://github.com/dakyskye/coc-cord): For Discord rich presence when using NVim

These can be installed with `:CocInstall coc-go` and `:CocInstall coc-cord` respectively!

I used to have [coc-vetur](https://github.com/neoclide/coc-vetur), but uninstalled it due to it causing lags in my NVim. You are welcome to try it out though, and let me know if it works fine for you!

## NVim (With Windows Terminal)

<p align="center">
  <img src="/nvim_image.png" height="480" />
</p>

## Background Image used

<p align="center">
  <img src="/BgImage.png" height="350" />
</p>

## NVim - Gui

<p align="center">
  <img src="/nvim_qt_image.png" height="480" />
</p>
