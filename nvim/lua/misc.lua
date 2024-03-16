-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Auto command resolve git conflict
vim.api.nvim_create_autocmd('User', {
  pattern = 'GitConflictDetected',
  callback = function()
    vim.notify('Conflict detected in '..vim.fn.expand('<afile>'))
    vim.keymap.set('n', 'cww', function()
      engage.conflict_buster()
      create_buffer_local_mappings()
    end)
  end
})


-- Options through Telescope
vim.api.nvim_set_keymap("n", "<Leader><tab>", "<Cmd>lua require('telescope.builtin').commands()<CR>", {noremap=false})

-- Fterm
vim.api.nvim_set_keymap("n", "<leader>tt", ":lua require('FTerm').toggle()<CR>", {noremap=true})
vim.api.nvim_set_keymap("t", "<leader>tt", '<C-\\><C-n>:lua require("FTerm").toggle()<CR>', {noremap=true})

-- Noice
vim.api.nvim_set_keymap("n", "<leader>nn", ":NoiceDismiss<CR>", {noremap=true})

vim.keymap.set("n", "<leader>ee", "<cmd>GoIfErr<cr>",
  {silent = true, noremap = true}
)

-- Git
vim.api.nvim_set_keymap("n", "<leader>gc", ":Git commit -m \"", {noremap=false})
vim.api.nvim_set_keymap("n", "<leader>gp", ":Git push -u origin HEAD<CR>", {noremap=false})

-- Resolve git conflict
vim.api.nvim_set_keymap("n", "<leader>go", ":GitConflictChooseOurs<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<leader>gt", ":GitConflictChooseTheirs<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<leader>gb", ":GitConflictChooseBoth<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<leader>gn", ":GitConflictChooseNone<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<leader>nn", ":GitConflictNextConflict<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<leader>pp", ":GitConflictPrevConflict<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<leader>ll", ":GitConflictListQf<CR>", {noremap=true, silent=true})

-- vim.api.nvim_set_keymap("n", "<leader>gtf", ":GoTestFunc<CR>", {noremap=true, silent=true})
-- vim.api.nvim_set_keymap("n", "<leader>gdt", ":GoDebug test<CR>", {noremap=true, silent=true})
