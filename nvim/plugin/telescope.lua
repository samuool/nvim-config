-- Load file browser extension
require('telescope').load_extension 'file_browser'

-- Telescope keybindings
vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<CR>') --Fuzzy finder
vim.keymap.set('n', '<leader>n', ':Telescope file_browser path=%:p:h select_buffer=true<CR>') --File Browser
vim.keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<CR>') --Live-grep

-- Bind command to move to config path
move_config = function()
	local config_dir = vim.fn.stdpath("config")
	require('telescope').extensions.file_browser.file_browser({
		cwd = config_dir
	})
end
vim.api.nvim_create_user_command('Config', move_config, {})
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
