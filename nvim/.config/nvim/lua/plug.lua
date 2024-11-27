-- Setup paths and install lazy.nvim if it's not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Define the state file path
local state_file = vim.fn.stdpath("data") .. "/load_ui"

-- Function to save the state to a file
local function save_state(load_ui)
	local file = io.open(state_file, "w")
	if file then
		file:write(load_ui and "1" or "0")
		file:close()
	end
end

-- Function to read the state from the file
local function read_state()
	local file = io.open(state_file, "r")
	if file then
		local content = file:read("*a")
		file:close()
		return content == "1"
	end
	return false
end

-- Check if the UI plugins should be loaded based on the state
local load_ui = read_state()

-- Setup lazy.nvim with conditional loading of plugins
require("lazy").setup({
	{ import = "plugins.dev" },
	{ import = "plugins.utility" },
	-- Conditionally import the UI plugins
	load_ui and { import = "plugins.ui" } or nil,
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

-- Keybinding to toggle the loading of UI plugins and save the state
vim.api.nvim_set_keymap("n", "<leader>lo", ":lua ToggleUIPlugins()<CR>", { noremap = true, silent = true })

function ToggleUIPlugins()
	-- Toggle the current state
	local current_state = read_state()
	local new_state = not current_state

	-- Save the new state
	save_state(new_state)

	-- Notify the user
	print("UI plugins " .. (new_state and "enabled" or "disabled") .. ". Restart Neovim to apply changes.")
end
