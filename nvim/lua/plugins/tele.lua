-- require('telescope').load_extension('harpoon')
require('telescope').load_extension('git_worktree')
require('telescope').load_extension('dap')
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
      preview_height = 0.7,
      vertical = {
        size = {
          width = "95%",
          height = "95%",
        },
      },
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      },
    },
  },
}

-- -- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
local builtin = require('telescope.builtin')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })


vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sS', builtin.git_status, { desc = '' })
vim.keymap.set('n', '<leader>sm', ":Telescope harpoon marks<CR>", { desc = 'Harpoon [M]arks' })
vim.keymap.set("n", "<Leader>sr", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", silent)
vim.keymap.set("n", "<Leader>sR", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", silent)
vim.keymap.set("n", "<Leader>sn", "<CMD>lua require('telescope').extensions.notify.notify()<CR>", silent)

-- Telescope dap
vim.keymap.set('n', '<leader>sl', ":Telescope dap list_breakpoints<CR>", { desc = 'List [B]reakpoints' })
