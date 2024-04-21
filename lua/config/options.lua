-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.opt.conceallevel = 0
vim.opt.scrolloff = 15
vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80
vim.opt.exrc = true

-- debug
vim.lsp.set_log_level("debug")
