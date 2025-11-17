vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<C-b>', vim.cmd.Ex)
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>l', function()
    vim.diagnostic.setloclist { severity = vim.diagnostic.severity.ERROR }
end)
vim.keymap.set('n', '<leader>w', function()
    vim.diagnostic.setloclist { severity = vim.diagnostic.severity.WARN }
end)

vim.keymap.set('n', '<leader>i', function()
    vim.diagnostic.setloclist { severity = vim.diagnostic.severity.HINT }
end)
vim.keymap.set('n', 'H', '_')
vim.keymap.set('n', 'L', '$')

vim.keymap.set('n', '<C-h>', '<C-W>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-W>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-W>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-W>l', { noremap = true })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<A-g>', '_')
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set('n', '<leader>bd', ':bd #<CR>')

vim.keymap.set('v', 'P', '"_dP')

vim.keymap.set('n', '<F1>', '<Nop>')
vim.keymap.set('n', '<F2>', '<Nop>')
vim.keymap.set('n', '<F3>', '<Nop>')
vim.keymap.set('n', '<F4>', '<Nop>')
vim.keymap.set('n', '<F5>', '<Nop>')
vim.keymap.set('n', '<F6>', '<Nop>')
vim.keymap.set('n', '<F7>', '<Nop>')
vim.keymap.set('n', '<F8>', '<Nop>')
vim.keymap.set('n', '<F9>', '<Nop>')
vim.keymap.set('n', '<F10>', '<Nop>')
vim.keymap.set('n', '<F11>', '<Nop>')
vim.keymap.set('n', '<F12>', '<Nop>')
vim.keymap.set('n', '<F13>', '<Nop>')
vim.keymap.set('n', '<F14>', '<Nop>')
