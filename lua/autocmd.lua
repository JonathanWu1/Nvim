-- :help lua-guide-autocommands

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_user_command('Vscode', ':vsplit|:split', {})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'sql', 'mysql', 'plsql' },
  callback = function()
    vim.bo.omnifunc = 'vim_dadbod_completion#omni'
    require('cmp').setup.buffer {
      sources = {
        { name = 'vim-dadbod-completion' },
        { name = 'buffer' },
      },
    }
  end,
})
