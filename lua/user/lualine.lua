local status_ok, lualine = pcall(require, "lualine")

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = "auto",
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local encoding = {
	"encoding",
	icons_enabled = true,
}

local fileformat = {
	"fileformat",
	fmt = function()
		return ""
	end,
}

lualine.setup({
	options = {
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
	},
	sections = {
		lualine_a = { "mode", branch },
		lualine_b = { diagnostics },
		lualine_c = { "filename" },
		lualine_x = { encoding },
		lualine_y = { fileformat },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = { "mode", { "filename", file_status = false } },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { encoding },
	},
	tabline = {},
	extensions = {},
})
