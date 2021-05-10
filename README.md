# NVim-Configuration
This repository contains my NeoVim-configurations. Please note, that a lot of the code in my [init.vim](/init.vim) is take from the documentation, and from [@Binx's init.vim](https://github.com/Binx-Codes/NeoVim-config) (which has changed a lot now). Also, I primarily use Neovim for Golang, Rust and Vue Projects, so a lot of my configurations are centered towards those languages.

## Plugins Used
 
1. File Explorer: [NERDTree](https://github.com/scrooloose/NERDTree)

2. Highlighting Files in the Explorer: [vim-nerdtree-syntax-highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)

3. File Icons in the Explorer: [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)

4. Auto pairs for '(' '\[' '{', etc: [auto-pairs](https://github.com/jiangmiao/auto-pairs)

5. Themes: [nord-theme](https://github.com/arcticicestudio/nord-vim) and [onedark](https://github.com/joshdick/onedark.vim)

6. Language Server Extensions: [coc](https://github.com/neoclide/coc.nvim)

7. Status Line (and File Tabs): [vim-airline](https://github.com/vim-airline/vim-airline)

8. Themes for the Status Line: [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)

9. Go Support: [vim-go](https://github.com/fatih/vim-go)

10. Color Highlighting: [vim-css-color](https://github.com/ap/vim-css-color)

11. Vue Syntax Highlighting: [vim-vue](https://github.com/posva/vim-vue)

Other than these, I also use three plugins with Coc, which are not listed in my [init.vim](/init.vim) -
1. [coc-go](https://github.com/josa42/coc-go): For the Gopls language server extension
2. [coc-vetur](https://github.com/neoclide/coc-vetur): For  the vetur language server extension
3. [coc-rls](https://github.com/neoclide/coc-rls): Rust language server extension
4. [coc-json](https://github.com/neoclide/coc-json): Autocomplete for json files

These can be installed with `:CocInstall coc-go`, `:CocInstall coc-vetur`, `:CocInstall coc-rls` and `:CocInstall coc-json` respectively!

Note: Vetur, the language server for Vue can be slow at times. I fixed this by following the suggestions from [this thread](https://github.com/vuejs/vetur/issues/2192). You can do so too, or just copy my config from my [coc-settings.json](/coc-settings.json).

## Go Projects With NVim (In Windows Terminal)

<p align="center">
  <img src="/nvim_image.png" height="480" />
</p>

## Vue Projects With NVim (In Windows Terminal)

<p align="center">
 <img src="/nvim_vue_image.png" height="480" />
</p>

## Background Image used

<p align="center">
  <img src="/BgImage.png" height="400" />
</p>

## NVim - Gui

<p align="center">
  <img src="/nvim_qt_image.png" height="480" />
</p>
