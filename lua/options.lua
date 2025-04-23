vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 8
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = false
vim.opt.splitbelow = false
vim.opt.list = true

vim.opt.listchars = {
    lead = ' ',
    tab = '  ',
    trail = '-',
    leadmultispace = ' ',
}

vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 15
vim.opt.wrap = false
