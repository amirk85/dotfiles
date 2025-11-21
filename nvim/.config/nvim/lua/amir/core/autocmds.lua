-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.breakindent = true
    vim.opt_local.showbreak = "↪ "
  end,
})


vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "dunstrc",
  callback = function()
    vim.bo.filetype = "dosini"
  end,
})
