vim.g.mapleader = ','

vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
vim.keymap.set('n', '<ESC><ESC>', '<cmd>noh<CR>', { noremap = true })

local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end

vim.keymap.set('n', '<leader>qf', quickfix, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>fw', function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative ~= '' then
            vim.api.nvim_set_current_win(win)
            return
        end
    end
end, { noremap = true, silent = true })
