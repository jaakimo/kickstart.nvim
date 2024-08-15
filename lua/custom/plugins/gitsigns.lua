local function next_hunk()
  local gs = require 'gitsigns'
  gs.nav_hunk 'next'
end
local function prev_hunk()
  local gs = require 'gitsigns'
  gs.nav_hunk 'prev'
end
local function inspect_hunk()
  local gs = require 'gitsigns'
  gs.preview_hunk()
end
local function inspect_hunk_inline()
  local gs = require 'gitsigns'
  gs.preview_hunk_inline()
end

local function next_hunk_inspect()
  local gs = require 'gitsigns'
  print 'next'
  gs.nav_hunk 'next'
  vim.keymap.set('n', 'n', next_hunk, { desc = 'Jump to next git change hunk' })
  vim.keymap.set('n', 'p', prev_hunk, { desc = 'Jump to previous git change hunk' })
  vim.keymap.set('n', '<Tab>', inspect_hunk_inline, { desc = 'Inspect hunk inline' })
  vim.keymap.set('n', '<s-Tab>', inspect_hunk, { desc = 'Inspect hunk' })
  vim.keymap.set('n', '<Esc>', function()
    vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
    vim.keymap.set('n', 'n', 'n')
    vim.keymap.del('n', 'p')
    vim.keymap.del('n', '<Tab>')
  end)
end

local function prev_hunk_inspect()
  local gs = require 'gitsigns'
  print 'prev'
  gs.nav_hunk 'prev'
  gs.preview_hunk_inline()
end

vim.keymap.set('n', '<leader>gn', next_hunk_inspect)
vim.keymap.set('n', '<leader>g<S-n>', prev_hunk_inspect)
vim.keymap.set('n', '<leader>gs', '<cmd>Git status<CR>')

-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    -- on_attach = function(bufnr)
    --   local gitsigns = require 'gitsigns'
    --
    --   local function map(mode, l, r, opts)
    --     opts = opts or {}
    --     opts.buffer = bufnr
    --     vim.keymap.set(mode, l, r, opts)
    --   end
    --
    --   -- Navigation
    --   map('n', ']c', function()
    --     if vim.wo.diff then
    --       vim.cmd.normal { ']c', bang = true }
    --     else
    --       gitsigns.nav_hunk 'next'
    --     end
    --   end)
    --
    --   map('n', '[c', function()
    --     if vim.wo.diff then
    --       vim.cmd.normal { '[c', bang = true }
    --     else
    --       gitsigns.nav_hunk 'prev'
    --     end
    --   end)
    --
    --   -- Actions
    --   map('n', '<leader>hs', gitsigns.stage_hunk)
    --   map('n', '<leader>hr', gitsigns.reset_hunk)
    --   map('v', '<leader>hs', function()
    --     gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
    --   end)
    --   map('v', '<leader>hr', function()
    --     gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
    --   end)
    --   map('n', '<leader>hS', gitsigns.stage_buffer)
    --   map('n', '<leader>hu', gitsigns.undo_stage_hunk)
    --   map('n', '<leader>hR', gitsigns.reset_buffer)
    --   map('n', '<leader>hp', gitsigns.preview_hunk)
    --   map('n', '<leader>hb', function()
    --     gitsigns.blame_line { full = true }
    --   end)
    --   map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    --   map('n', '<leader>hd', gitsigns.diffthis)
    --   map('n', '<leader>hD', function()
    --     gitsigns.diffthis '~'
    --   end)
    --   map('n', '<leader>td', gitsigns.toggle_deleted)
    --
    --   -- Text object
    --   map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    -- end,
  },
}
