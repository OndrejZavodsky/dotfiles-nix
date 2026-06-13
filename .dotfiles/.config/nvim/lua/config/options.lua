vim.opt.number = true
vim.opt.relativenumber = true
vim.g.lazyvim_picker = "telescope"
vim.opt.guicursor = {
	"n-v-c:block", -- normal, visual, command
	"i:block", -- insert
	"r-cr:block", -- replace modes
	"o:block",
}
vim.opt.tabstop = 3 -- tab displays as 3 spaces
vim.opt.shiftwidth = 3 -- indent is 3 spaces
vim.opt.expandtab = false -- use real tabs not spaces
