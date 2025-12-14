return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        ensure_installed = { 'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'c_sharp', 'tsx', 'typescript', 'scss' },
        auto_install = true,
        highlight = {
            enable = true,
        },
        indent = { enable = true },
    },
}
