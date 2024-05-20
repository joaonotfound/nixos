require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "javascript", "c", "lua", "vim", "vimdoc", "query", "rust", "go", "typescript" },

  sync_install = false,

  incremental_selection = {
	  enable = true,
	  keymaps = {
		  init_selection = '<C-space>',
		  node_incremental = '<C-space>',
		  scope_incremental = false,
		  node_decremental = '<C-backspace>',
	  },
  },

  auto_install = true,

  -- ignore_install = { "javascript" },

  indent = { enable = true },

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
