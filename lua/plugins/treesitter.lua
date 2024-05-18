-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'typescript', 'css', 'scss','c_sharp', 'json', 'html', 'lua', 'luadoc','javascript' },
      auto_install = true,
      highlight = {
        enable = true,
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.install').prefer_git = true
      require('nvim-treesitter.configs').setup(opts)
    end,
  }
