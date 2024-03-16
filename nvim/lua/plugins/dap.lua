
require('dapui').setup {
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = vim.fn.has("nvim-0.7"),
  layouts = {
    {
      elements = {
        "scopes",
        -- "watches",
        -- "stacks",
      },
      size = 0.2,
      position = "left"
    },
    -- {
    --   elements = {
    --     "repl",
    --     -- "console",
    --     -- "breakpoints"
    --   },
    --   size = 0.2,
    --   position = "bottom",
    -- },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  },
}

-- local dap = require('dap')
-- dap.configurations.go = {
--     {
--         -- type = 'go',
--         -- name = "Debug",
--         -- request = 'launch',
--         -- program = "${file}"
--           type = "go",
--       name = "attach remote",
--       mode = "remote",
--       request = "attach",
--       program = "${filedirname}",
--
--     }
-- }
--
-- dap.configurations.NvimTree = {
--     {
--         type = 'executable',
--         name = "Debug NvimTree File",
--         request = 'launch',
--         program = "${file}"
--     }
-- }


require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "attach remote",
      mode = "remote",
      request = "attach",
      program = "${filedirname}",
    },
  },
  -- delve configurations
  delve = {
    -- the path to the executable dlv which will be used for debugging.
    -- by default, this is the "dlv" executable on your PATH.
    path = "dlv",
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "38697",
    -- additional args to pass to dlv
    args = {},
    -- the build flags that are passed to delve.
    -- defaults to empty string, but can be used to provide flags
    -- such as "-tags=unit" to make sure the test suite is
    -- compiled during debugging, for example.
    -- passing build flags using args is ineffective, as those are
    -- ignored by delve in dap mode.
    build_flags = "",
  },
}

require('nvim-dap-virtual-text').setup({})
vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })

-- Debugger
vim.api.nvim_set_keymap("n", "<leader>dt", ":DapUiToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>do", ":DapStepOver<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>di", ":DapStepInto<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>m", ":lua require('harpoon.mark').add_file()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {noremap=true})

vim.keymap.set(
            "n",
            "<leader>dgt",  -- dg as in debu[g] [t]race
            ":lua require('dap').set_log_level('TRACE')<CR>"
        )
vim.keymap.set(
            "n",
            "<leader>d-",
            function()
                require("dap").restart()
            end
        )
        vim.keymap.set(
            "n",
            "<leader>d_",
            function()
                require("dap").terminate()
                require("dapui").close()
            end
        )
