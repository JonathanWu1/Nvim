return {

    { -- Linting
        'mfussenegger/nvim-lint',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local lint = require 'lint'

            -- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
            lint.linters_by_ft = {
                markdown = { 'markdownlint' },
                html = { 'htmlhint' },
                javascript = { 'ts-standard' },
                yaml = { 'yamllint' },
            }

            local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
            vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },
}
