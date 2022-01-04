local options = {
	number = true,
	relativenumber = true,
	tabstop=2,
	softtabstop=2,
	shiftwidth=2,
	scrolloff=8,
	colorcolumn="80",
	signcolumn="yes",
	mouse="a",
	updatetime=300,
	pumheight=10,
	termguicolors=true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
