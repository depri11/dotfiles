vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap=false})
-- twilight
vim.api.nvim_set_keymap("n", "tw", ":Twilight<enter>", {noremap=false})
-- buffers
vim.api.nvim_set_keymap("n", "tk", ":blast<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tj", ":bfirst<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "th", ":bprev<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tl", ":bnext<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "td", ":bdelete<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tdd", ":bdelete!<enter>", {noremap=false})
-- files
-- vim.api.nvim_set_keymap("n", "QQ", ":q!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "QQ", ":lua require('dapui').close()<CR>:q!<CR>", {noremap=false})
vim.api.nvim_set_keymap("n", "<C-s>", ":w!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "QA", ":lua require('dapui').close()<CR>:qa<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "E", "$", {noremap=false})
vim.api.nvim_set_keymap("n", "B", "^", {noremap=false})
vim.api.nvim_set_keymap("n", "TT", ":TransparentToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "st", ":TodoTelescope<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "ss", ":noh<CR>", {noremap=true})
-- splits
vim.api.nvim_set_keymap('n', '<A-x>', ':vertical resize +10<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<A-z>', ':vertical resize -10<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<A-n>', ':horizontal resize +10<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<A-m>', ':horizontal resize -10<CR>', {noremap=true, silent=true})

vim.keymap.set('n', '<space><space>', "<cmd>set nohlsearch<CR>")

-- nav tree
vim.api.nvim_set_keymap("n", "<S-Tab>", ":NvimTreeToggle<CR>", {noremap=true})

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move line

local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)

vim.keymap.set('n', '<S-t>', '[[:%bd|e#|:bp<CR>]]', opts) -- Remove all buffer except current buffer
vim.keymap.set('n', '<A-e>', ':%bd!<CR>', opts) -- Remove all buffer

-- Terminal
-- vim.keymap.set('n', '<C-n>', ':ToggleTerm<CR>', opts)
