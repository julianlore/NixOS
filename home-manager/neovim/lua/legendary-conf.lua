local function time ()
  local t, _ = os.date("%I:%M")
  -- TODO: substring for characters after 0 when string starts with 0, i.e. 05:30
  -- if (select(1, string.sub(t, 1, 1)) == "0") then
  --   return select(1, string.sub(t, 2))
  -- end

  return t
end

return {
  keymaps = {
    -- Keymaps for familiarity with other applications
    { '<F1>', "<Cmd>Legendary<CR>" },
    { '<C-s>', "<Cmd>w<CR>", mode = { 'n', 'i' } },
    -- Doesn't work
    -- { '<C-BS>', { n = "bdw", i = '<C-w>' }, opts = { expr = true } },

    -- Arrow key keymaps (sorry)
    { '<C-Up>', '<C-u>' },
    { '<C-Down>', '<C-d>' },

    -- Allow navigating command suggestions with arrow keys
    { '<Up>', { c = function ()
        if vim.fn.pumvisible() then return '<C-p>' else return '<Up>' end
      end
      },
      opts = { expr = true }
    },
    { '<Down>', { c = function ()
        if vim.fn.pumvisible() then return '<C-n>' else return '<Down>' end
      end
      },
      opts = { expr = true }
    },

    { '<Space>', '<Nop>', opts = { silent = true } },

    { '<leader>at', function ()
      return "a" .. time() .. " "
      end, description = "[I]nsert time with hours and minutes in 12 hour format", opts = { expr = true } },
    -- Insert - and time after time in a list, i.e. "- x:xx word" -> "- x:xx - yy:yy word"
    { '<leader>ie', function ()
      return "04wi- " .. time() .. " <Esc>"
      end, description = "[I]nsert [E]nd time", opts = { expr = true } },
    { '<leader>id', function ()
      return "a[[" .. os.date("%Y-%m-%d") .. "]] <Esc>"
      end, description = "[I]nsert [D]ate", opts = { expr = true } },
    -- Remap for dealing with word wrap
    { 'k', "v:count == 0 ? 'gk' : 'k'", opts = { expr = true, silent = true } },
    { 'j', "v:count == 0 ? 'gj' : 'j'", opts = { expr = true, silent = true } },

    -- Telescope
    -- See `:help telescope.builtin`
    { '<leader><space>', "<Cmd>lua require('telescope').extensions.recent_files.pick()<CR>", description = '[ ] Find recently opened files' },
    { '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
        })
      end, description = '[/] Fuzzily search in current buffer' },
    { '<leader>sc', require('telescope.builtin').commands, description = '[S]earch [C]ommands' },
    { '<leader>sf', require('telescope.builtin').find_files, description = '[S]earch [F]iles' },
    { '<leader>sh', require('telescope.builtin').help_tags, description = '[S]earch [H]elp' },
    { '<leader>sw', require('telescope.builtin').grep_string, description = '[S]earch current [W]ord' },
    { '<leader>sg', require('telescope.builtin').live_grep, description = '[S]earch by [G]rep' },
    { '<leader>sd', require('telescope.builtin').diagnostics, description = '[S]earch [D]iagnostics' },

    -- Telekasten
    { '<leader>zz', "<cmd>Telekasten panel<CR>", description = "Telekasten Panel"},
    { '<leader>zf', "<cmd>Telekasten find_notes<CR>", description = "Telekasten [F]ind Notes"},
    { '<leader>zg', "<cmd>Telekasten search_notes<CR>", description = "Telekasten [G]rep Notes"},
    { '<leader>zd', "<cmd>Telekasten find_daily_notes<CR>", description = "Telekasten [D]aily Notes"},
    { '<leader>zb', "<cmd>Telekasten show_backlinks<CR>", description = "Telekasten [B]acklinks"},
    { '<leader>zi', "<cmd>Telekasten insert_link<CR>", description = "Telekasten [I]nsert Link" },
    { '<leader>z<CR>', "<cmd>Telekasten follow_link<CR>", description = "Telekasten Follow Link"},

    -- Diagnostics
    { '[d', vim.diagnostic.goto_prev, description = "Go to previous diagnostic message" },
    {']d', vim.diagnostic.goto_next, description = "Go to next diagnostic message" },
    {'<leader>e', vim.diagnostic.open_float, description = "Open floating diagnostic message" },
    {'<leader>q', vim.diagnostic.setloclist, description = "Open diagnostics list" },

    -- Git
    { '<leader>l', "<cmd>LazyGit<CR>", description = "[L]azygit" },
    { '<leader>GG', "<Cmd>G<CR>", description = "[G]it"},
  },
  commands = {
    { ":Trim", ':%s/\\s\\+$//e', description = "Trim trailing whitespace" },
    { ":Gst", ":Git status", description = "Git status" },
  }
}
