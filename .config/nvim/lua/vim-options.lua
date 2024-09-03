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
vim.keymap.set('i', '<C-d>', '<Esc>', {})
