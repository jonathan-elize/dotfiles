require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.lualine")
require("user.comment")
require("user.gitsigns")
require("user.nvim-tree")
require("user.bufferline")
require("user.toggleterm")
require("user.project")
require("user.alpha")
require("user.whichkey")
require("user.null-ls")
require("user.trouble")
vim.cmd([[
	"set highlight SignColumn guibg=bg_panel
]])
-- TODO make lsp rename blank to start
-- WSL yank support
vim.api.nvim_exec([[
	let s:clip = '/mnt/c/Windows/System32/clip.exe' 
	if executable(s:clip)
			augroup WSLYank
					autocmd!
					autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
			augroup END
	end
]], false)
