local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		go = { "gci" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" } },
	},
})


vim.keymap.set({ 'n', 'v' }, '=', function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 50,
	})
end, {})
