--- Normal mode
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
-- format
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format buffer with LSP' })

-- Keep the cursor centerred when jumping around
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- remaps when using different clipboard than unnamedplus
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- disable recording macros
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', 'q', '<nop>')

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')

vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })
-- vim.keymap.set("n", "J", "mzJ`z")

--- Edit mode
-- Exit edit mode
vim.keymap.set('i', '<C-c>', '<Esc>')

---- Visual mode
-- paste over visual selection
vim.keymap.set('x', '<leader>p', [["_dP]])
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- harpoon
--
-- local harpoon = require 'harpoon'
-- vim.keymap.set('n', '<leader>a', function()
--   harpoon:list():append()
-- end)
-- vim.keymap.set('n', '<C-e>', function()
--   harpoon.ui:toggle_quick_menu(harpoon:list())
-- end)
--
-- vim.keymap.set('n', '<S-F1>', function()
--   harpoon:list():select(1)
-- end)
-- vim.keymap.set('n', '<S-F2>', function()
--   harpoon:list():select(2)
-- end)
-- vim.keymap.set('n', '<S-F3>', function()
--   harpoon:list():select(3)
-- end)
-- vim.keymap.set('n', '<S-F4>', function()
--   harpoon:list():select(4)
-- end)

-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set('n', '<C-S-P>', function()
--   harpoon:list():prev()
-- end)
-- vim.keymap.set('n', '<C-S-N>', function()
--   harpoon:list():next()
-- end)

-- run test file
vim.keymap.set('n', '<leader>tt', function()
  require('neotest').run.run(vim.fn.expand '%')
end, { desc = 'Run test file' })
-- run nearest test
vim.keymap.set('n', '<leader>tr', function()
  require('neotest').run.run()
end, { desc = 'Run nearest test' })
-- debug test file
vim.keymap.set('n', '<leader>tD', function()
  require('neotest').run.run { strategy = 'dap', suite = false }
end, { desc = 'Debug test file' })
-- debug nearest test
vim.keymap.set('n', '<leader>td', function()
  require('neotest').run.run { vim.fn.expand '%', strategy = 'dap', suite = false }
end, { desc = 'Debug nearest test' })

vim.keymap.set('n', '<leader>ts', function()
  require('neotest').summary.toggle()
end, { desc = 'Toggle test summary' })
