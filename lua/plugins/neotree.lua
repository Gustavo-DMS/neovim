return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    opts = {

        source_selector = {
            winbar = true,
        },
        event_handlers = {
            {
                event = "file_opened",
                handler = function(file_path)
                    -- auto close
                    -- vimc.cmd("Neotree close")
                    -- OR
                    -- require("neo-tree.sources.filesystem").reset_search(state)
                    require("neo-tree.command").execute({ action = "close" })
                end
            },
        }
    },
}
