local options = {
	number = true,
	relativenumber = true,
	tabstop=2,
	softtabstop=2,
	shiftwidth=2,
	scrolloff=8,
	colorcolumn="80",
	signcolumn="auto",
	mouse="a",
	updatetime=300,
	pumheight=10,
	termguicolors=true,
	showmode=false,
	timeoutlen=500,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
