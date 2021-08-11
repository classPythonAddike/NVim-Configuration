vim.cmd("filetype plugin on")
vim.cmd("syntax on")
vim.cmd("filetype indent off")

-- Synchronize the system clipboard with neovim's
vim.opt.clipboard = "unnamedplus"

vim.completeopt = {"menuone", "noselect"}
vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.smarttab = false
vim.opt.smartindent = true
vim.opt.cindent = false
vim.opt.cursorline = true

vim.g.NERDTreeHijackNetrw = 0
vim.g.ranger_replace_netrw = 1

vim.g.rooter_patterns = { '.git', 'Makefile', '*.sln', 'build/', '__pycache__', 'src/' }

vim.g.dashboard_custom_header = {
  "            []                                       []              ",
  "          .:[]:_          ^^                       ,:[]:.            ",
  "        .: :[]: :-.                             ,-: :[]: :.          ",
  "      .: : :[]: : :`._                       ,.': : :[]: : :.        ",
  "    .: : : :[]: : : : :-._               _,-: : : : :[]: : : :.      ",
  "_..: : : : :[]: : : : : : :-._________.-: : : : : : :[]: : : : :-._  ",
  "_:_:_:_:_:_:[]:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:[]:_:_:_:_:_:_  ",
  "!!!!!!!!!!!![]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!![]!!!!!!!!!!!!! ",
  "^^^^^^^^^^^^[]^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^[]^^^^^^^^^^^^^ ",
  "            []                                       []              ",
  "            []                                       []              ",
  "            []                                       []              ",
  " ~~^-~^_~^~/  \\~^-~^~_~^-~_^~-^~_^~~-^~_~^~-~_~-^~_^/  \\~^-~_~^-~~-  ",
  "~ _~~- ~^-^~-^~~- ^~_^-^~~_ -~^_ -~_-~~^- _~~_~-^_ ~^-^~~-_^-~ ~^    ",
}

vim.g.dashboard_default_executive ='telescope'

vim.cmd("set omnifunc=syntaxcomplete#Complete")
vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")

require('lualine').setup{
	options = {
		theme = 'nightfly'
	}
}

vim.g.UltiSnipsExpandTrigger = "<tab>"
