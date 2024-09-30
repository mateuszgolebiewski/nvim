local builtin = require('telescope.builtin')
-- Set the leader
vim.g.mapleader = " "

-- Key mappins for Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Key mappings for Neo-tree
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { silent = true, noremap = true })  -- Toggle Neo-tree
vim.keymap.set('n', '<leader>nf', ':Neotree focus<CR>', { silent = true, noremap = true })  -- Focus Neo-tree window
vim.keymap.set('n', '<leader>nr', ':Neotree reveal<CR>', { silent = true, noremap = true }) -- Reveal current file in Neo-tree

-- Key mappings for LazyGit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })

