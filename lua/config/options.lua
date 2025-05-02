-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.opt.conceallevel = 0
vim.opt.scrolloff = 15
vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80
vim.opt.exrc = true
vim.opt.guifont = "Fira Code:h11"

vim.g.lazyvim_python_lsp = "pyright"
-- debug
vim.lsp.set_log_level("debug")
