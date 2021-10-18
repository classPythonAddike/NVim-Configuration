vim.cmd [[
	let mapleader = "\<Space>"
	set timeoutlen=500
]]

vim.api.nvim_set_keymap("n", "<C-Q>", ":bd<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-S>", ":w<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-S>", "<Esc>:w<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-A>", "ggVG", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-A>", "<Esc> ggVG", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-F>", ":Telescope file_browser<CR>", { noremap = true })

function Build()
	local ft = vim.bo.filetype

	if ft == "go" then
		vim.cmd(":TermExec cmd='go build .'")
	else
		vim.cmd(":echom \"No build configurations set for filetype '" .. ft .. "'!\"")
	end
end

function Run()
	local ft = vim.bo.filetype

	if ft == "go" then
		vim.cmd(":TermExec cmd='go run .'")
	elseif ft == "python" then
		vim.cmd(":TermExec cmd='python3 %'")
	else
		vim.cmd(":echom \"No run configurations set for filetype '" .. ft .. "'!\"")
	end
end

vim.api.nvim_set_keymap("n", "<Leader>j", ":bprevious<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>k", ":bnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>l", ":blast<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>h", ":bfirst<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<Leader>b", ":lua Build()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>r", ":lua Run()<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<Leader>c", ":CommentToggle<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<Leader>f", ":NvimTreeOpen<CR>", { noremap = true })
