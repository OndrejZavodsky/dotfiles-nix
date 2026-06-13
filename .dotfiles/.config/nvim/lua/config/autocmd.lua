vim.api.nvim_create_autocmd("SwapExists", {
	callback = function()
		vim.v.swapchoice = "e" -- "e" = Edit anyway
	end,
})
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
