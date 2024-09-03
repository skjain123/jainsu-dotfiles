vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

vim.cmd("set nu")

-- colorscheme that will be used when installing plugins.
install = { colorscheme = { "catppuccin" } }
-- automatically check for plugin updates
checker = { enabled = true }

-- load nvim faster
vim.loader.enable()

-- easier way to get to normal mode while in insert mode
vim.keymap.set({ "i", "v" }, "<C-d>", "<Esc>", {})

-- enter visual mode easier - like vscode
vim.keymap.set({ "i", "n" }, "<S-Up>", "v", {})
vim.keymap.set({ "i", "n" }, "<S-k>", "v", {})

vim.keymap.set({ "i", "n" }, "<S-Down>", "v", {})
vim.keymap.set({ "i", "n" }, "<S-j>", "v", {})

vim.keymap.set({ "i", "n" }, "<S-Left>", "v", {})
vim.keymap.set({ "i", "n" }, "<S-h>", "v", {})

vim.keymap.set({ "i", "n" }, "<S-Right>", "v", {})
vim.keymap.set({ "i", "n" }, "<S-l>", "v", {})
