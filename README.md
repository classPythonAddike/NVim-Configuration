# Neovim Config

This repository contains my NeoVim-configurations.
Please note, that a lot of the code in my config (mainly [plugins.lua](/lua/plugins.lua)) was implemented by [@Binx](https://github.com/Binx-Codes).

I primarily use Neovim for Golang, Python, Svelte and Vue Projects, so a lot of my configurations are centered towards those languages and frameworks.

## Setup

### Prerequisites

Make sure you have Node, npm and Python3 installed. Then install `pynvim` with `pip install pynvim` or `pip3 install pynvim`

### Install

If you want to use my config, simple clone it to your own machine and change the config path in (init.lua)[/init.lua]. Once you do, open NeoVim and let packer install itself.

Then run `:PackerSync`, `:PackerCompile`, and `:PackerInstall` to install all the plugins. Don't worry if you encounter errors - that is probably just because plugins are not installed.

Once the plugins are installed, NeoVim should work without issues. Feel free to open an issue if it doesn't!
