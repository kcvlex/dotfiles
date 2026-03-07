vim.g.indent_guides_start_level = 2
vim.g.indent_guides_guide_size = 1
vim.g.indent_guides_enable_on_vim_startup = 1

vim.opt.fileencodings = 'utf-8'
vim.opt.number = true
vim.opt.swapfile = false
vim.opt.smartindent = true
vim.opt.virtualedit = 'onemore'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoread = true
vim.bo.autoread = true
vim.opt.inccommand = ''
vim.opt.viminfo = { "'100", '<0', 's10', 'h' }

vim.cmd.highlight({ 'LineNr', 'ctermfg=239' })
