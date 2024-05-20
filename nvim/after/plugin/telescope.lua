local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>gsf', builtin.git_files, {})
vim.keymap.set('n', '<leader>gsc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gsb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>gss', builtin.git_status, {})
vim.keymap.set('n', '<leader>ps', function ()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
