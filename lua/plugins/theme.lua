return {
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	priority = 1000,
	config = function()
		vim.g.moonflyTransparent = false -- прозрачность
		vim.g.moonflyItalics = true -- курсив
		vim.g.moonflyUnderlineMatchParen = true
		vim.g.moonflyCursorColor = true
		vim.g.moonflyTerminalColors = true

		vim.cmd("colorscheme moonfly")
	end,
}
