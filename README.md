# Neovim Config

<img src="/Screenshots/luafile.png">

This repository contains my NeoVim-configurations.
Please note, that a lot of the code in my config (mainly [plugins.lua](/lua/plugins.lua)) was implemented by [@Binx](https://github.com/Binx-Codes).

I primarily use Neovim for Golang, Python, Svelte and Vue Projects, so a lot of my configurations are centered towards those languages and frameworks.

## Setup

### Prerequisites

Make sure you have Node, npm and Python3 installed. Then install `pynvim` with `pip install pynvim` or `pip3 install pynvim` and `neovim` with `npm install -g neovim`.

### Install

#### Linux

1. Clone this config to your machine to `~/.config/nvim`.
2. Create an alias in your .zshrc or .bashrc called `nvim` and set it to -
```bash
alias nvim="nvim --cmd 'profile start ~/profile.log' \
    --cmd 'profile func *' \
    --cmd 'profile file *' \
    -c 'profdel func *' \
    -c 'profdel file *' \
    -c 'qa!' \
	&& nvim
```
3. Then open NeoVim (ignore any errors you encounter when it opens) and run `:PackerSync` to install the plugins. Note that this may take a while - some plugins like `vim-go` also install the go binaries. You may remove this from the plugins list in [plugins.lua](/lua/plugins.lua).
4. Finally, restart NeoVim, and you should be good to go!

#### Windows

Installation steps are slightly more complicated for Windows.

1. Clone this repository to `C:\Users\USERNAME\AppData\Local\nvim`
2. Open [init.lua](/init.lua) and change `config_path` to `"C:\Users\USERNAME\AppData\Local\nvim\"`
3. Also, change `python3` to `python` in the `Run()` function in [keybinds.lua](/lua/keybinds.lua)
4. You will also need to change the dashboard header and footer in [dashboard-config.lua](/lua/dashboard-config.lua)
5. Then open NeoVim (ignore any errors you encounter when it opens) and run `:PackerSync` to install the plugins. Note that this may take a while - some plugins like `vim-go` also install the go binaries. You may remove this from the plugins list in [plugins.lua](/lua/plugins.lua).
6. Finally, restart NeoVim, and you should be good to go!

## Sidenote

My current config has about 30 plugins, which is quite a lot. Yet it takes only ~200 ms to load (You can test this with `nvim some-file.extension --startup-time logs.txt` and then open `logs.txt` to see the break down of the startup time).
This is because most of the plugins are loaded _on demand_. So when you actually open up NeoVim, only a handful of plugins are sourced.

Feel free to add more plugins, and configurations, and open a PR to implement them!
