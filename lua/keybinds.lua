vim.api.nvim_set_keymap('n', '<C-Q>', ':Bclose<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-S>', ':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-S>', '<Esc>:w<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-A>', 'ggVG', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-A>','<Esc> ggVG', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-F>', ':Ranger<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-F>', ':Telescope<CR>', {noremap = true})

function Build()
    local ft = vim.bo.filetype

    if ft == "go" then
        vim.cmd(":TermExec cmd='go build .'")
    elseif ft == "vue" then
        vim.cmd(":TermExec cmd='npm run build'")
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

vim.api.nvim_set_keymap('n', '<F2>', ':bprevious<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F3>', ':bnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F4>', ':blast<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<F5>', ":lua Build()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<F6>', ":lua Run()<CR>", {noremap = true})

vim.api.nvim_set_keymap('n', '<F7>', ":CommentToggle<CR>", {noremap = true})
vim.api.nvim_set_keymap('i', '<F7>', "<Esc>:CommentToggle<CR>i", {noremap = true})

vim.api.nvim_set_keymap('n', '<F8>', ':NvimTreeFindFile<CR>', {noremap = true})
