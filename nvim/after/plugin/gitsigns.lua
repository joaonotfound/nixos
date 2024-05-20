local gitsigns = require("gitsigns")

gitsigns.setup({
	signs = {
		add          = { text = '┃' },
		change       = { text = '┃' },
		delete       = { text = '_' },
		topdelete    = { text = '‾' },
		changedelete = { text = '~' },
		untracked    = { text = '┆' },
	},
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 100,
		ignore_whitespace = false,
		virt_text_priority = 100,
	},
	on_attach = function(bufnr)
		local gitsigns = require('gitsigns')

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map('n', ']c', function()
			if vim.wo.diff then
				vim.cmd.normal({']c', bang = true})
			else
				gitsigns.nav_hunk('next')
			end
		end)

		map('n', '[c', function()
			if vim.wo.diff then
				vim.cmd.normal({'[c', bang = true})
			else
				gitsigns.nav_hunk('prev')
			end
		end)

		-- Actions
		map('n', '<leader>hs', gitsigns.stage_hunk)
		map('n', '<leader>hr', gitsigns.reset_hunk)
		map('n', '<leader>hus', gitsigns.undo_stage_hunk)
		map('n', '<leader>hp', gitsigns.preview_hunk_inline)
		map('n', '<leader>dt', gitsigns.diffthis)
		-- map('n', '<leader>td', gitsigns.toggle_deleted)

		-- Text object
		-- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
	end
})
