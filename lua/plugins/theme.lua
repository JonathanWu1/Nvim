return {
    'rose-pine/neovim',
    priority = 1000,
    lazy = false,
    init = function()
        require('rose-pine').setup {
            enable = {},
            styles = {
                italic = false,
                trasparency = true,
            },
            groups = {
                panel = 'base',
            },
        }
        -- You can configure highlights by doing something like:
        vim.cmd 'colorscheme rose-pine'
    end,
}
