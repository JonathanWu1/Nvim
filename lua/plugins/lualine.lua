return {
    'nvim-lualine/lualine.nvim',
    event = 'ColorScheme',
    config = function()
        require('lualine').setup {
            options = {
                theme = 'palenight',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = { 'filename' },
                lualine_x = {},
                lualine_y = { 'fileformat', 'filetype' },
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        }
    end,
}
