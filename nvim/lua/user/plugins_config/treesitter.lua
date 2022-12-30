local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = { "bash", "python", "lua", "rust", "go" }, -- or all
	ignore_install = { "phpdoc" },
	auto_install = true,
	highlight = {
		enable = true,
		disable = { "css" },
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "css" } },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	}
})
