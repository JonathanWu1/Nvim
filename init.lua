require("init")
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{ 
		'rose-pine/neovim',
		priority = 1000, -- Make sure to load this before all the other start plugins.
		lazy = false,
		init = function()
			require("rose-pine").setup({
				enable = {
					terminal = true,
					migrations = true,
				},
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				}

			})
			-- You can configure highlights by doing something like:
			vim.cmd("colorscheme rose-pine")
			vim.cmd.hi 'Comment gui=none'
		end,
	},
    { import = 'plugins' }
})

