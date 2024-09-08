local util = require("util")
local winbuf = require("util.winbuf")

return {
  "folke/which-key.nvim",
  priority = 1000,
  lazy = false,

  keys = {
    { "<F2>", "<CMD>WhichKey<CR>", mode = { "n", "i", "v", "x", "o", "t" }, desc = "Show keys [which-key]" },
  },

  opts = {
    preset = "modern",

    sort = {
      "order",
      "alphanum",
      function(item)
        return item.raw_key:find("^<.*>$") and 1 or 0
      end,
    },

    expand = function(node)
      return not node.desc
    end,

    delay = function(ctx)
      return ctx.plugin and 0 or 250
    end,

    filter = function(mapping)
      if mapping.rhs and type(mapping.rhs) == "string" then
        if mapping.rhs:match("VM%-") then
          mapping.desc = mapping.rhs .. " [visual-multi]"
          return true
        end

        if mapping.rhs:match("nvim%-surround") then
          mapping.desc = mapping.rhs .. " [surround]"
          return true
        end

        local _, _, mini_plugin = mapping.rhs:find("Mini(%u%a+)")
        if mini_plugin and mapping.desc then
          mapping.desc = mapping.desc .. " [mini." .. mini_plugin:lower() .. "]"
          return true
        end
      end

      if mapping.lhs:find("<Plug>") then
        return false
      end

      return true
    end,

    win = {
      border = "single",
      width = { max = math.huge },
      wo = { winblend = 0 },
    },

    icons = {
      separator = " ",
      group = "󱡠 ",
      rules = {
        -- : azure  --
        -- : blue   -- UI
        -- : cyan   -- Search/navigation
        -- : green  -- Text modification (formatting, moving, replacing, etc.)
        -- : grey   -- Non-plugin keymaps
        -- : orange -- Code
        -- : purple -- External tools/files
        -- : red    -- Diagnostics
        -- : yellow -- Text navigation/text objects
        { pattern = "%[aerial%]", icon = "󱘎 aerial", color = "orange" },
        { pattern = "%[cliff%]", icon = "↕️ cliff", color = "yellow" },
        { pattern = "%[conform%]", icon = "󰦨 conform", color = "green" },
        { pattern = "%[crates%]", icon = "󱘗 crates", color = "orange" },
        { pattern = "%[dadbod%]", icon = " dadbod", color = "purple" },
        { pattern = "%[dap%]", icon = "󰃤 dap", color = "orange" },
        { pattern = "%[dial%]", icon = "󰦒 dial", color = "green" },
        { pattern = "%[diffview%]", icon = "󰊢 diffview", color = "blue" },
        { pattern = "%[fidget%]", icon = "󰍡 fidget", color = "blue" },
        { pattern = "%[flash%]", icon = "󰉁 flash", color = "yellow" },
        { pattern = "%[gitsigns%]", icon = "󰊢 gitsigns", color = "purple" },
        { pattern = "%[goto%-preview%]", icon = " goto-preview", color = "orange" },
        { pattern = "%[grug%-far%]", icon = "󰛔 grug-far", color = "green" },
        { pattern = "%[gx%]", icon = " gx", color = "purple" },
        { pattern = "%[helpview%]", icon = "󰋖 helpview", color = "blue" },
        { pattern = "%[lazy%]", icon = "󰒲 lazy", color = "purple" },
        { pattern = "%[lsp%]", icon = "󰌘 lsp", color = "orange" },
        { pattern = "%[luasnip%]", icon = " luasnip", color = "green" },
        { pattern = "%[markview%]", icon = " markview", color = "blue" },
        { pattern = "%[mason%]", icon = "󱌢 mason", color = "purple" },
        { pattern = "%[mini.ai%]", icon = "󰓾 mini.ai", color = "yellow" },
        { pattern = "%[mini.align%]", icon = " mini.align", color = "green" },
        { pattern = "%[mini.bracketed%]", icon = "󰅪 mini.bracketed", color = "yellow" },
        { pattern = "%[mini.bufremove%]", icon = " mini.bufremove", color = "blue" },
        { pattern = "%[mini.files%]", icon = "󰙅 mini.files", color = "cyan" },
        { pattern = "%[mini.move%]", icon = " mini.move", color = "green" },
        { pattern = "%[mini.operators%]", icon = " mini.operators", color = "green" },
        { pattern = "%[mini.pick%]", icon = "󰢷 mini.pick", color = "cyan" },
        { pattern = "%[mini.splitjoin%]", icon = " mini.splitjoin", color = "green" },
        { pattern = "%[mini.visits%]", icon = " mini.visits", color = "cyan" },
        { pattern = "%[neo%-tree%]", icon = "󰙅 neo-tree", color = "cyan" },
        { pattern = "%[neogit%]", icon = "󰊢 neogit", color = "purple" },
        { pattern = "%[noice%]", icon = " noice", color = "blue" },
        { pattern = "%[obsidian%]", icon = "󰺿 obsidian", color = "purple" },
        { pattern = "%[octo%]", icon = "󰊢 octo", color = "purple" },
        { pattern = "%[oil%]", icon = "󰙅 oil", color = "cyan" },
        { pattern = "%[overseer%]", icon = " overseer", color = "purple" },
        { pattern = "%[quicker%]", icon = "󰙅 quicker", color = "red" },
        { pattern = "%[rip%-substitute%]", icon = "󰛔 rip-substitute", color = "green" },
        { pattern = "%[sibling%-swap%]", icon = " sibling-swap", color = "green" },
        { pattern = "%[surround%]", icon = "󰅲 surround", color = "green" },
        { pattern = "%[telescope%]", icon = " telescope", color = "cyan" },
        { pattern = "%[toggleterm%]", icon = "  toggleterm", color = "purple" },
        { pattern = "%[treesitter%-textsubjects%]", icon = "󱁉 treesitter-textsubjects", color = "yellow" },
        { pattern = "%[treesj%]", icon = " treesj", color = "green" },
        { pattern = "%[trouble%]", icon = "󰙅 trouble", color = "red" },
        { pattern = "%[tssorter%]", icon = "  tssorter", color = "green" },
        { pattern = "%[ufo%]", icon = " ufo", color = "blue" },
        { pattern = "%[various%-textobjs%]", icon = " various-textobjs", color = "yellow" },
        { pattern = "%[visual%-multi%]", icon = " visual-multi", color = "green" },
        { pattern = "%[which%-key%]", icon = "⌨️ ", color = "grey" },
        { pattern = "%[yanky%]", icon = "󰆏 yanky", color = "green" },
      },
    },

    replace = {
      key = {
        { "<NL>", "<C-J>" },
      },
      desc = {
        { "([^<]*)<Plug>%(?([^)]*)%)?", "%1%2" },
        { "([^%[]*) %[.*%]", "%1" },
      },
    },

    spec = {
      { "<Leader>", group = "Leader" },
      { "<Leader><Tab>", group = "Tabs" },
      { "<Leader>b", group = "Buffers" },
      { "<Leader>c", group = "Code" },
      { "<Leader>d", group = "Debug" },
      { "<Leader>f", group = "Find" },
      { "<Leader>g", group = "Git" },
      { "<Leader>go", group = "Octo [octo]" },
      { "<Leader>l", group = "LSP [lsp]" },
      { "<Leader>o", group = "Overseer" },
      { "<Leader>t", group = "Terminal" },
      { "<Leader>u", group = "UI/toggles" },
      { "<Leader>w", group = "Windows" },
      { "<Leader>x", group = "Diagnostics/quickfix" },
      { ",", group = "Misc" },
      { "`", group = "Marks" },
      { "'", group = "Marks" },
      { "\"", group = "Registers" },
      { "[", group = "Previous", mode = { "n", "v", "x", "o" } },
      { "]", group = "Next", mode = { "n", "v", "x", "o" } },
      { "g", group = "Goto/operators" },
      { "gp", group = "Goto preview" },
      { "c", group = "Code", mode = { "o", "x" } },
      { "z", group = "Fold/scroll" },
      { "<C-w>", group = "Windows" },

      -- Normal mode
      {
        mode = "n",
        { "<Leader>L", "<CMD>Lazy sync<CR>", desc = "Plugins [lazy]" },
        { "<Leader>C", "<CMD>:e $MYVIMRC<CR>", desc = "Edit configuration [which-key]" },
        { "<Leader>W", function() require("which-key").show({ keys = "<C-W>", loop = true }) end, desc = "Windows (hydra mode)" },
        {
          "<Leader>O",
          function()
            if not require("util.winbuf").buf_filter({ noname = true }) then
              vim.cmd.tabnew()
            end

            local dir = "~/vaults/Notes"
            vim.cmd.lcd(dir)
            require("neo-tree.command").execute({ action = "show", dir = dir })
          end,
          desc = "Notes [obsidian]",
        },
        { "<C-,>", "<CMD>:e $MYVIMRC<CR>", desc = "Edit configuration [which-key]" },
        { "<Leader>q", "<CMD>qa<CR>", desc = "Quit all [which-key]" },
        { "<BS>", '<CMD>noh | echon ""<CR>', desc = "Clear search highlighting [which-key]" },
        { "<Esc>", '<CMD>noh | echon ""<CR><Esc>', desc = "Clear search highlighting [which-key]" },
        { "<C-S>", "<CMD>w!<CR>", desc = "Save [which-key]" },
        { "<C-G>", "2<C-g>", desc = "Print current file name [which-key]" },

        {
          "<C-Q>",
          function() return vim.cmd.normal({ vim.fn.reg_recording() == "" and "qq" or "q", bang = true }) end,
          desc = "Start/stop macro recording [which-key]",
        },
        { "@", "Q", desc = "Play macro [which-key]" },

        -- Adding blank lines
        { "<Leader><Enter>", "<CMD>put! =repeat(nr2char(10), v:count1)|silent ']+<CR>k", desc = "Add blank line on current line [which-key]" },
        { "[<Space>", "<CMD>put! =repeat(nr2char(10), v:count1)|silent ']+<CR>", desc = "Add blank line above [which-key]" },
        { "]<Space>", "<CMD>put =repeat(nr2char(10), v:count1)|silent '[-<CR>", desc = "Add blank line below [which-key]" },

        -- Better motions with word wrap on
        { "j", "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Line down [which-key]" },
        { "k", "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Line up [which-key]" },

        -- Center screen after scrolling
        { "<C-D>", "<C-D>zz", hidden = true, desc = "Scroll down and center [which-key]" },
        { "<C-U>", "<C-U>zz", hidden = true, desc = "Scroll up and center [which-key]" },
        { "<C-F>", "<C-F>zz", hidden = true, desc = "Page forwards and center [which-key]" },
        { "<C-B>", "<C-B>zz", hidden = true, desc = "Page backwards and center [which-key]" },

        -- Buffers
        { "q", function() winbuf.close_window_or_buffer() end, desc = "Delete buffer/close window [which-key]" },
        { "<S-h>", "<CMD>bprevious<CR>", desc = "Previous buffer [which-key]" },
        { "<S-l>", "<CMD>bnext<CR>", desc = "Next buffer [which-key]" },
        { "Q", "<CMD>%bdelete|lua MiniStarter.open()<CR>", desc = "Delete all buffers [which-key]" },
        { "<Leader>bl", "<CMD>set buflisted<CR>", desc = "Make buffer listed [which-key]" },
        { "<Leader>bnl", "<CMD>set nobuflisted<CR>", desc = "Make buffer unlisted [which-key]" },
        { "<Leader>bm", "<CMD>set modified<CR>", desc = "Make buffer modified [which-key]" },
        { "<Leader>bnm", "<CMD>set nomodified<CR>", desc = "Make buffer unmodified [which-key]" },
        {
          "<Leader>bh",
          function()
            winbuf.buffers_run(
              { normal = true, hidden = true, listed = true },
              function(bufnr)
                vim.cmd.bdelete(bufnr)
              end
            )
          end,
          desc = "Delete hidden buffers [which-key]",
        },
        {
          "<Leader>bo",
          function()
            winbuf.buffers_run(
              { normal = true, listed = true },
              function(bufnr)
                if bufnr ~= vim.api.nvim_get_current_buf() then
                  vim.cmd.bdelete(bufnr)
                end
              end
            )
          end,
          desc = "Delete other buffers [which-key]",
        },

        -- Window opening/closing
        { "<Leader>-", "<CMD>new<CR>", desc = "Open new file in split [which-key]" },
        { "<Leader>.-", "<CMD>new %:h<CR>", desc = "Edit current directory in split [which-key]" },
        { "<Leader>.\\", "<CMD>vnew %:h<CR>", desc = "Edit current directory in vsplit [which-key]" },
        { "<Leader><Leader>-", "<CMD>split<CR>", desc = "Open current file in split [which-key]" },
        { "<Leader><Leader>.", "<CMD>e %:h<CR>", desc = "Edit current directory [which-key]" },
        { "<Leader><Leader>\\", "<CMD>vsplit<CR>", desc = "Open current file in vsplit [which-key]" },
        { "<Leader>\\", "<CMD>vnew<CR>", desc = "Open new file in vsplit [which-key]" },
        { "<Leader>wT", "<C-W>T", desc = "Open current window in new tab [which-key]" },
        { "<Leader>w]", "<C-W>]", desc = "Go to identifier in split [which-key]" },
        { "<Leader>wc", "<C-W>c", desc = "Close current window [which-key]" },
        { "<Leader>wo", "<C-W>o", desc = "Make current window the only one [which-key]" },
        { "<Leader>wq", "<C-W>q", desc = "Quit window [which-key]" },
        { "<Leader>ws", "<C-W>s", desc = "Split window (horizontal) [which-key]" },
        { "<Leader>wv", "<C-W>v", desc = "Split window (vertical) [which-key]" },
        { "<Leader>wz", "<C-W>z", desc = "Close preview window [which-key]" },
        { "<Leader>w}", "<C-W>}", desc = "Go to identifier in preview [which-key]" },
        { "<Leader>wx", "<C-W>x", desc = "Exchange current window with next [which-key]" },
        { "<Leader>wa", "<C-^>", desc = "Edit alternate buffer in current window [which-key]" },
        { "<Leader>wA", "<C-W>^", desc = "Edit alternate buffer in split [which-key]" },
        {
          "<A-->",
          function()
            winbuf.windows_run(
              { buf = { normal = false } },
              function(winid) vim.api.nvim_win_close(winid, false) end
            )
          end,
          desc = "Close all non-editor windows [which-key]",
        },

        -- Window movements
        { "<C-h>", "<C-W>h", desc = "Left one window [which-key]" },
        { "<C-j>", "<C-W>j", desc = "Up one window [which-key]" },
        { "<C-k>", "<C-W>k", desc = "Down one window [which-key]" },
        { "<C-l>", "<C-W>l", desc = "Right one window [which-key]" },
        { "<Leader>wh", "<C-W>h", desc = "Left one window [which-key]" },
        { "<Leader>wj", "<C-W>j", desc = "Up one window [which-key]" },
        { "<Leader>wk", "<C-W>k", desc = "Down one window [which-key]" },
        { "<Leader>wl", "<C-W>l", desc = "Right one window [which-key]" },
        { "<Leader>wH", "<C-W>H", desc = "Move current window to left [which-key]" },
        { "<Leader>wJ", "<C-W>J", desc = "Move current window to bottom [which-key]" },
        { "<Leader>wK", "<C-W>K", desc = "Move current window to top [which-key]" },
        { "<Leader>wL", "<C-W>L", desc = "Move current window to right [which-key]" },
        { "<Leader>wR", "<C-W>R", desc = "Rotate windows upwards/leftwards [which-key]" },
        { "<Leader>wW", "<C-W>W", desc = "Previous window [which-key]" },
        { "<Leader>ww", "<C-W><C-W>", desc = "Next window [which-key]" },
        { "<Leader>wr", "<C-W>r", desc = "Rotate windows downwards/rightwards [which-key]" },

        -- Window size
        { "<Leader>w<Bar>", "<C-W><Bar>", desc = "Maximize window width [which-key]" },
        { "<Leader>w=", "<C-W>=", desc = "Make windows equally high and wide [which-key]" },
        { "<Leader>w_", "<C-W>_", desc = "Maximize window height [which-key]" },
        { "<S-C-Down>", "<CMD>resize -2<CR>", desc = "Decrease window height [which-key]" },
        { "<S-C-Left>", "<CMD>vertical resize -2<CR>", desc = "Decrease window width [which-key]" },
        { "<S-C-Right>", "<CMD>vertical resize +2<CR>", desc = "Increase window width [which-key]" },
        { "<S-C-Up>", "<CMD>resize +2<CR>", desc = "Increase window height [which-key]" },
        -- { "<A-_>", "<CMD>resize -2<CR>", desc = "Decrease window height [which-key]" },
        -- { "<A-<>", "<CMD>vertical resize -2<CR>", desc = "Decrease window width [which-key]" },
        -- { "<A->>", "<CMD>vertical resize +2<CR>", desc = "Increase window width [which-key]" },
        -- { "<A-+>", "<CMD>resize +2<CR>", desc = "Increase window height [which-key]" },

        -- Tabs
        { "<A-H>", "gT", desc = "Previous tab [which-key]" },
        { "<A-L>", "gt", desc = "Next tab [which-key]" },
        { "[t", "gT", desc = "Previous tab [which-key]" },
        { "]t", "gt", desc = "Next tab [which-key]" },
        { "<C-S-t>", "<CMD>tabnew<CR>", desc = "Open new tab [which-key]" },
        { "<Leader><Tab><BS>", "<CMD>tabclose<CR>", desc = "Close tab [which-key]" },
        { "<Leader><Tab><Tab>", "<CMD>tabnew<CR>", desc = "New tab [which-key]" },
        { "<Leader><Tab>h", "<CMD>tabprevious<CR>", desc = "Previous tab [which-key]" },
        { "<Leader><Tab>l", "<CMD>tabnext<CR>", desc = "Next tab [which-key]" },
        { "<Leader><Tab>[", "<CMD>tabprevious<CR>", desc = "Previous tab [which-key]" },
        { "<Leader><Tab>]", "<CMD>tabnext<CR>", desc = "Next tab [which-key]" },
        { "<Leader><Tab>q", "<CMD>tabclose<CR>", desc = "Close tab [which-key]" },

        -- Folds
        { "zff", function() util.close_text_object_folds("@function.outer") end, desc = "Close folds for functions [which-key]" },
        { "zfc", function() util.close_text_object_folds("@class.outer") end, desc = "Close folds for classes [which-key]" },
        { "z1", function() util.close_folds_with_level(1) end, desc = "Close folds with level 1 [which-key]" },
        { "z2", function() util.close_folds_with_level(2) end, desc = "Close folds with level 2 [which-key]" },
        { "z3", function() util.close_folds_with_level(3) end, desc = "Close folds with level 3 [which-key]" },
        { "z4", function() util.close_folds_with_level(4) end, desc = "Close folds with level 4 [which-key]" },

        -- Code
        { "<Leader>ci", function() vim.show_pos() end, desc = "Inspect under cursor [which-key]" },
        { "<Leader>cI", function() vim.treesitter.inspect_tree() end, desc = "Inspect treesitter tree [which-key]" },

        { ",.", "<C-U>", desc = "Scroll up [which-key]" },
        { ",/", "<C-D>", desc = "Scroll down [which-key]" },
        { ",[", "<C-T>", desc = "Pop tag from stack [which-key]" },
        { ",]", "<C-]>", desc = "Jump to tag [which-key]" },
        { ",cd", "<CMD>cd %:h<CR>", desc = "Change current working directory to current file directory [which-key]" },
        { ",do", "<CMD>diffoff<CR>", desc = "Diff off [which-key]" },
        { ",dt", "<CMD>diffthis<CR>", desc = "Diff this [which-key]" },
        { ",du", "<CMD>diffupdate<CR>", desc = "Diff update [which-key]" },
        { ",r", "<C-R>", desc = "Redo last change [which-key]" },
        { ",vb", "<C-V>", desc = "Visual block mode [which-key]" },
        { ",x12", "<CMD>%!x12pp<CR><CMD>set ft=x12<CR>", desc = "Format X12 file [which-key]" },
        { ",cr", "<CMD>%!dos2unix<CR>", desc = "Convert line endings to CR [which-key]" },

        -- Toggles
        { "<Leader>uC", function() util.toggle("cursorcolumn") end, desc = "Toggle cursorcolumn [which-key]" },
        { "<Leader>uc", function() util.toggle("cursorline") end, desc = "Toggle cursorline [which-key]" },
        {
          "<Leader>ud",
          function()
            local enabled = vim.diagnostic.is_enabled()
            vim.notify((enabled and "Disabled" or "Enabled") .. " diagnostics")
            vim.diagnostic.enable(not enabled)
          end,
          desc = "Toggle diagnostics",
        },
        { "<Leader>uf", function() require("util.format").toggle_autoformat() end, desc = "Toggle format on save (global) [which-key]" },
        { "<Leader>uF", function() require("util.format").toggle_autoformat(0) end, desc = "Toggle format on save (buffer) [which-key]" },
        { "<Leader>uw", function() util.toggle("wrap") end, desc = "Toggle wrap [which-key]" },
        { "<Leader>ul", function() util.toggle_number() end, desc = "Toggle line numbers [which-key]" },
        { "<Leader>ur", function() util.toggle("relativenumber") end, desc = "Toggle relative line numbers [which-key]" },

        -- Yank/paste
        { "Y", "_y$", desc = "Yank line characters [which-key]" },
        { "<S-Insert>", '"+P', desc = "Paste from system clipboard [which-key]" },

        -- Motions
        { "b", "<CMD>call search('\\<', 'b')<CR>", desc = "Previous word [which-key]" },
        { "e", "<CMD>call search('\\>')<CR>", desc = "Next end of word [which-key]" },
        { "ge", "<CMD>call search('\\>', 'b')<CR>", desc = "Previous end of word [which-key]" },
        { "w", "<CMD>call search('\\<')<CR>", desc = "Next word [which-key]" },
        { "{", "[{", desc = "Previous unmatched { [which-key]" },
        { "}", "]}", desc = "Next unmatched } [which-key]" },
        { "(", "[(", desc = "Previous unmatched ( [which-key]" },
        { ")", "])", desc = "Next unmatched ) [which-key]" },
      },

      -- Insert mode
      {
        mode = "i",
        { "<Esc>", "<Esc>`^", desc = "Exit insert mode [which-key]" },
        { "<C-s>", "<C-\\><C-o><CMD>w!<CR>", desc = "Save [which-key]" },
        { "<C-BS>", "<C-w>", desc = "Delete previous word [which-key]" },
        { "<C-h>", "<C-w>", desc = "Delete previous word [which-key]" },
        { "<A-h>", "<Left>", noremap = false, desc = "Left [which-key]" },
        { "<A-j>", "<Down>", noremap = false, desc = "Down [which-key]" },
        { "<A-k>", "<Up>", noremap = false, desc = "Up [which-key]" },
        { "<A-l>", "<Right>", noremap = false, desc = "Right [which-key]" },
        { "<A-p>", "<C-o>P", noremap = false, desc = "Paste [which-key]" },
        { "<C-Enter>", "<Esc>m`o<Esc>``a", desc = "Insert blank line below [which-key]" },
        { "<C-S-Enter>", "<Esc>m`O<Esc>``a", desc = "Insert blank line above [which-key]" },
        { "<S-Insert>", "<C-r><C-o>+", desc = "Paste from system clipboard [which-key]" },
      },

      -- Visual and select mode
      {
        mode = "v",
        { "<C-Insert>", '"+y', desc = "Yank to system clipboard [which-key]" },
        { "<S-Insert>", '"+P', desc = "Paste from system clipboard [which-key]" },
        { "<Leader>sl", ":sort i<CR>", desc = "Sort lines [which-key]" },
        { "<Leader>sn", ":sort in<CR>", desc = "Sort lines by number [which-key]" },
        { "<Leader>su", ":sort iu<CR>", desc = "Sort lines unique [which-key]" },
        { "<lt>", "<lt>gv", desc = "Decrease indent [which-key]" },
        { ">", ">gv", desc = "Increase indent [which-key]" },
        { ",.", "<C-U>", desc = "Scroll up [which-key]" },
        { ",/", "<C-D>", desc = "Scroll down [which-key]" },
      },

      -- Terminal mode
      {
        mode = "t",
        { "<C-h>", "<C-\\><C-N><C-w>h", desc = "Left [which-key]" },
        { "<C-j>", "<C-\\><C-N><C-w>j", desc = "Down [which-key]" },
        { "<C-k>", "<C-\\><C-N><C-w>k", desc = "Up [which-key]" },
        { "<C-l>", "<C-\\><C-N><C-w>l", desc = "Right [which-key]" },
        { "<C-BS>", "<C-h>", desc = "Delete previous word [which-key]" },
        { "<C-h>", "<C-h>", desc = "Delete previous word [which-key]" },
        { "<S-Enter>", "<Enter>", desc = "Insert enter [which-key]" },
        { "<S-Space>", "<Space>", desc = "Insert space [which-key]" },
        { "<S-Esc>", "<C-\\><C-N>", desc = "Go to normal mode [which-key]" },
        { "<S-Insert>", '<C-\\><C-N>"+pi', desc = "Paste from system clipboard [which-key]" },
      },

      -- Cmdline mode
      {
        mode = "c",
        { "<S-Insert>", "<C-R><C-R>+", desc = "Paste from system clipboard [which-key]", silent = false },
        { "<C-BS>", "<C-w>", desc = "Delete previous word [which-key]", silent = false },
        {
          "<C-j>",
          function() return vim.fn.wildmenumode() == 1 and "<C-n>" or "<C-j>" end,
          expr = true,
          desc = "Wildmenu down [which-key]",
          silent = false,
        },
        {
          "<C-k>",
          function() return vim.fn.wildmenumode() == 1 and "<C-p>" or "<C-k>" end,
          expr = true,
          desc = "Wildmenu up [which-key]",
          silent = false,
        },
      },
    },
  },

  config = function(_, opts)
    require("which-key.icons").rules = {}
    require("which-key").setup(opts)
  end,
}
