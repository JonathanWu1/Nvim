return {
    'rose-pine/neovim',
    priority = 1000,
    lazy = false,
    init = function()
        require('rose-pine').setup {
            variant = 'auto',
            extend_background_behind_borders = true,

            enable = {},
            styles = {
                italic = false,
                trasparency = false,
            },
        }
        vim.cmd 'colorscheme rose-pine'
    end,
}
