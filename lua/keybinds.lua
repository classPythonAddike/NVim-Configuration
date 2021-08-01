vim.api.nvim_set_keymap('n', '<F2>', ':bprevious<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F3>', ':bnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F4>', ':blast<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Q>', ':BufferClose<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-S>', ':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-S>', '<Esc>:w<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<F8>', ':NvimTreeFindFile<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-A>', 'ggVG', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-A>','<Esc> ggVG', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-F>', ':Ranger<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-F>', '<Esc>:Ranger<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<S-F>', ':Telescope<CR>', {noremap = true})

function Build()
    local ft = vim.bo.filetype

    if ft == "go" then
        vim.cmd(":!go build")
    elseif ft == "vue" then
        vim.cmd(":!npm run build")
    elseif ft == "cpp" then
        vim.cmd(":call execute(':!g++ % -o ' . expand('%:r') . '.exe')")
    else
        vim.cmd(":echom \"No build configurations set for filetype '" .. ft .. "'!\"")
    end
end

function Run()
    local ft = vim.bo.filetype

    if ft == "go" then
        vim.cmd(":ter go run")
    elseif ft == "python" then
        vim.cmd(":ter python3 %")
    elseif ft == "cpp" then
        vim.cmd(":call execute(':!g++ % -o ' . expand('%:r') . '.exe')")
        vim.cmd(":execute(':ter ' . expand('%:r') . '.exe')")
    else
        vim.cmd(":echom \"No run configurations set for filetype '" .. ft .. "'!\"")
    end
end

vim.api.nvim_set_keymap('n', '<F5>', ":lua Build()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<F6>', ":lua Run()<CR>", {noremap = true})
