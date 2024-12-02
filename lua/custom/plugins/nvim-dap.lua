return {
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require 'dap'
    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        pythonPath = function()
          return '/usr/bin/python'
        end,
      },
    }

    vim.keymap.set('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>', { desc = 'dap.continue()' })
    -- vim.keymap.set('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>',{desc='dap.toggle_breakpoint()'})
    vim.keymap.set('n', '<leader>dr', '<cmd>lua require"dap".repl_toggle()<CR>', { desc = 'dap.repl_toggle()' })
    vim.keymap.set('n', '<leader>ds', '<cmd>lua require"dap".step_over()<CR>', { desc = 'dap.step_over()' })
    vim.keymap.set('n', '<leader>di', '<cmd>lua require"dap".step_into()<CR>', { desc = 'dap.step_into()' })
    vim.keymap.set('n', '<leader>do', '<cmd>lua require"dap".step_out()<CR>', { desc = 'dap.step_out()' })
    vim.keymap.set('n', '<leader>du', '<cmd>lua require"dap".up()<CR>', { desc = 'dap.up()' })
    vim.keymap.set('n', '<leader>dd', '<cmd>lua require"dap".down()<CR>', { desc = 'dap.down()' })
    vim.keymap.set('n', '<leader>dl', '<cmd>lua require"dap".run_last()<CR>', { desc = 'dap.run_last()' })
  end,
}
