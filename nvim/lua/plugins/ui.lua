vim.g.alduin_Shout_Aura_Whisper = 1
vim.cmd.colorscheme('alduin')

require('lualine').setup {
  sections = {
    lualine_c = {
      { 'filename', path = 1 },
    },
  },
}

require('lsp-endhints').setup {}

require('ibl').setup {}
