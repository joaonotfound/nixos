-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
local nvim = require("nvim-tree")

local function on_attach(buffer)
	local api = require("nvim-tree.api")

	vim.keymap.set('n','<leader>t', function() api.tree.toggle() end, {})
end

nvim.setup({
	view = {
		width = {
			padding = 20
		}
	}
})


require("nvim-web-devicons").setup()
