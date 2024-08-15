vim.keymap.set('n', '<leader>uu', '<cmd>UndotreeToggle<CR>', {
  expr = true,
  replace_keycodes = false,
})
return {
  'mbbill/undotree',
}
