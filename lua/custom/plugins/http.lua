vim.keymap.set('n', '<leader>rh', '<cmd>Rest run<CR>', {
  expr = true,
  replace_keycodes = false,
})
return {
  'rest-nvim/rest.nvim',
}
