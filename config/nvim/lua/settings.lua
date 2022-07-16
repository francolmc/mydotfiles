--Neovim API aliases
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt
-- General


--UI
opt.number = true
opt.mouse = "a"
opt.ignorecase = true
opt.smartcase = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.clipboard = "unnamedplus"

opt.splitright = true
opt.hidden = true
opt.guifont = {"Fira Code", "h14"}
opt.lazyredraw = true
g.mapleader = ';'
g.maplocalleader = ';'
g.laststatus = 2
-- Correccion ortografica con markdown
exec ([[
	augroup markdownSpell
		autocmd!
		autocmd FileType markdown setlocal spell spelllang=es
		autocmd BufRead,BufNewFile *.md setlocal spell spelllang=es
	augroup END
]], false)

-- Plantillas
exec([[
  augroup templates
      au!
      let g:template_name = 'Lorenzo Carbonell <a.k.a. atareao>'
      autocmd BufNewFile *.* silent! execute '0r $HOME/.config/nvim/templates/'.expand("<afile>:e").'.tpl'
	  autocmd BufNewFile *.controller.ts silent! execute '0r $HOME/.config/nvim/templates/controller.ts.tpl'
      autocmd BufNewFile * %s/{{YEAR}}/\=strftime('%Y')/ge
      autocmd BufNewFile * %s/Lorenzo Carbonell <a.k.a. atareao>/\=template_name/ge
      autocmd BufNewFile * %s/{{EVAL\s*\([^}]*\)}}/\=eval(submatch(1))/ge
  augroup END
]], false)

exec ([[
	augroup readtemplates
		au!
	autocmd BufRead *.controller.ts silent! execute '0r $HOME/.config/nvim/templates/controller.ts.tpl'
	autocmd BufRead * %s/Lorenzo Carbonell <a.k.a. atareao>/\=template_name/ge
	augroup END
]], false)
