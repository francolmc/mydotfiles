-- Using Lua functions
local opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map('n', '<leader>fc', '<cmd>lua require("telescope.builtin").commands()<cr>', opts)
map('n', '<leader>fd', '<cmd>lua require("telescope.builtin").diagnostics()<cr>', opts)
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
map('n', '<leader>fgb', '<cmd>lua require("telescope.builtin").git_branches()<cr>', opts)
map('n', '<leader>fgc', '<cmd>lua require("telescope.builtin").git_commits()<cr>', opts)
map('n', '<leader>fgs', '<cmd>lua require("telescope.builtin").git_status()<cr>', opts)
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
