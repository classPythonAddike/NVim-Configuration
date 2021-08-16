# Neovim Config

<img src="/Screenshots/luafile.png">

This repository contains my NeoVim-configurations.
Please note, that a lot of the code in my config (mainly [plugins.lua](/lua/plugins.lua)) was implemented by [@Binx](https://github.com/Binx-Codes).

I primarily use Neovim for Golang, Python, Svelte and Vue Projects, so a lot of my configurations are centered towards those languages and frameworks.

## Setup

### Prerequisites

Make sure you have Node, npm and Python3 installed. Then install `pynvim` with `pip install pynvim` or `pip3 install pynvim` and `neovim` with `npm install -g neovim`.

Then install the lua language server, and configure it in [lsp-config.lua](./lua/lsp-config.lua)

Finally, install `universal-ctags` with `sudo apt install universal-ctags`.

### Install

#### Linux

1. Clone this config to your machine to `~/.config/nvim`.
2. Then open NeoVim (ignore any errors you encounter when it opens) and run `:PackerSync` to install the plugins. Note that this may take a while - some plugins like `vim-go` also install the go binaries. You may remove this from the plugins list in [plugins.lua](/lua/plugins.lua).
3. Finally, restart NeoVim, and you should be good to go!

## Sidenote

My current config has about 30 plugins, which is quite a lot. Yet it takes only ~200 ms to load (You can test this with `nvim some-file.extension --startup-time logs.txt` and then open `logs.txt` to see the break down of the startup time).
This is because most of the plugins are loaded _on demand_. So when you actually open up NeoVim, only a handful of plugins are sourced.

Feel free to add more plugins, and configurations, and open a PR to implement them!
