vim.g.mapleader = " "
require("config.options")
require("config.autocmd")
require("config.keymaps")
require("config.lazy")

local pyright_cfg = vim.lsp.config.pyright
pyright_cfg.settings = {
	python = { analysis = { autoSearchPaths = true } },
}

vim.lsp.config("pyright", pyright_cfg)
vim.lsp.enable("pyright")

vim.opt.clipboard = "unnamedplus"
