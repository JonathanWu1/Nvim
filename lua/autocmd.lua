vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'qf', -- quickfix/location list share this
    callback = function()
        vim.opt_local.wrap = true -- enable wrapping
        vim.opt_local.linebreak = true -- wrap at word boundaries
    end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = '*.curl',
    callback = function()
        vim.opt.filetype = 'curl'
    end,
})
