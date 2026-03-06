local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set(
  "n", 
  "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({'hover', 'actions'})
  end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
  'n',
  "J",
  function()
    vim.cmd.RustLsp('joinLines')
  end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
  'n',
  '<leader>em',
  function()
    vim.cmd.RustLsp({ 'expandMacro' })
  end,
  { silent = true, buffer = bufnr }
)


vim.keymap.set(
  'n',
  '<leader>ee',
  function()
    vim.cmd.RustLsp({ 'explainError', 'current' })
  end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
  'n',
  '<leader>rd',
  function()
    vim.cmd.RustLsp({ 'renderDiagnostic', 'current' })
  end,
  { silent = true, buffer = bufnr }
)

-- vim.keymap.set(
--   'v',
--   "J",
--   function()
--     vim.cmd.RustLsp { 'joinLines', 'range' }
--   end,
--   { silent = true, buffer = bufnr }
-- )
