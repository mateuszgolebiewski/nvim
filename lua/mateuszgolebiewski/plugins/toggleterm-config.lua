require("toggleterm").setup{
  size = 20,                         -- Size of the terminal window
  open_mapping = [[<C-\>]],          -- Key mapping to toggle the terminal
  hide_numbers = true,               -- Hide line numbers in terminal buffers
  shade_filetypes = {},              -- Filetypes to shade, empty means all
  shade_terminals = true,            -- Shade terminal background
  shading_factor = 2,                -- Degree of shading
  start_in_insert = true,            -- Start in insert mode
  insert_mappings = true,            -- Apply insert mode mappings
  terminal_mappings = true,          -- Apply terminal key mappings
  persist_size = true,               -- Remember terminal size
  direction = 'float',               -- 'vertical' | 'horizontal' | 'tab' | 'float'
  close_on_exit = true,              -- Close terminal on process exit
  shell = vim.o.shell,               -- Shell to use
  float_opts = {
    border = 'curved',               -- Border style: 'single', 'double', 'shadow', 'curved', etc.
    winblend = 3,                    -- Transparency level
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
