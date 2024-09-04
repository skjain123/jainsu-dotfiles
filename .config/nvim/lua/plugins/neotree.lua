-- neotree
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },

    config = function()
        vim.keymap.set("n", "<S-Tab>", ":Neotree . reveal left<CR>", { noremap = true, silent = true })
    end,

    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                show_hidden_count = true,
                hide_dotfiles = false,
                hide_gitignored = true,
                hide_by_name = {
                    -- '.git',
                    -- '.DS_Store',
                    -- 'thumbs.db',
                },
                never_show = {},
            },
        }
    }


    -- show hidden files
    -- require("neo-tree").setup {
    --     ffilesystem = {
    --         filtered_items = {
    --             visible = true,
    --             show_hidden_count = true,
    --             hide_dotfiles = false,
    --             hide_gitignored = true,
    --             hide_by_name = {
    --                 -- '.git',
    -- '.DS_Store',
    -- 'thumbs.db',
    --             },
    --             never_show = {},
    --         },
    --     }
    -- }
}
