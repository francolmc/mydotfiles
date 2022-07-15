--Aliases
local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local cmd = vim.cmd

map("n", "w", ":w<CR>", default_opts)
map("n", "q", ":q<CR>", default_opts)
map("n", "<Leader>qq", ":q!<CR>", default_opts)
map("n", "tt", ":t.<CR>", default_opts)
map("n", "ff", ":CocCommand eslint.executeAutofix<Enter>", default_opts)
map("n", "<c-t>", ":ToggleTerm size=15 direction=horizontal<enter>", default_opts)
map("n", "<c-r>" , ":NvimTreeRefresh<enter>", default_opts)
