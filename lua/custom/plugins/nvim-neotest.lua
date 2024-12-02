return {
  {
    'nvim-neotest/neotest-python',
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
      'nvim-neotest/neotest-plenary',
      'nvim-neotest/neotest-vim-test',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            dap = { justMyCode = false },
            args = { '--log-level', 'DEBUG' },
            runner = 'pytest',
            python = '.venv/bin/python',
            is_test_file = function(file_path, test)
              local is_file = string.match(file_path, '_test%.py$') or string.match(file_path, 'test_.*%.py$')
              if is_file == nil then
                is_file = false
              else
                is_file = true
              end
              -- print('is_test_file called, is_file: ' .. tostring(is_file) .. ' path: ' .. file_path)
              return is_file
            end,
          },
          require 'neotest-plenary',
          require 'neotest-vim-test' {
            ignore_file_types = { 'python', 'vim', 'lua' },
          },
          -- require 'neotest-java',
        },
      }
    end,
  },

  --
  -- opts = {
  --   adapters = {
  --
  --     ['neotest-java'] = {
  --       -- config here
  --     },
  --     ['neotest-python'] = {
  --       -- config here
  --       dap = { justMyCode = false },
  --       is_test_file = function(file)
  --         print('is_test_file called, path: ' .. file)
  --         local is_file = string.match(file, '_test%.py$') or string.match(file, 'test_.*%.py$')
  --         if is_file == nil then
  --           is_file = false
  --         else
  --           is_file = true
  --         end
  --         print('is_test_file called, is_file: ' .. tostring(is_file) .. ' path: ' .. file)
  --         return is_file
  --       end,
  --     },
  --   },
  -- },
  --     ['neotest-python'] = {
  --       -- config here
  --       dap = { justMyCode = false },
  --     },
  --   },
  {
    'rcasia/neotest-java',
  },
}
