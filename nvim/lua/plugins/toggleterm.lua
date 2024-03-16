require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-l>]],
  hide_numbers = true,
  -- shade_filetypes = { "none" },
  shade_terminals = false,
  shading_factor = 3,
  start_in_insert = false,
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  -- persist_size = true,
  -- persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  -- direction = 'horizontal',
  auto_scroll = true,
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
