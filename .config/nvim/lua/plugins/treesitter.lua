-- treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			-- ensure support for these file types
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
