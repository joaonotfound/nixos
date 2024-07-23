-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
local nvim = require("nvim-tree")

nvim.setup({
	view = {
		width = {
			padding = 20
		}
	}
})

vim.keymap.set('v','<leader>t', function() nvim.api.tree.toggle() end, {})

require("nvim-web-devicons").setup()
