local util = require("util")
local winbuf = require("util.winbuf")

return {
  "folke/which-key.nvim",
  priority = 1000,
  lazy = false,

  keys = {
    {
      "<F2>",
      function() require("which-key").show() end,
      mode = { "n", "i", "v", "x", "o", "t" },
      desc = "Show keys [which-key]",
    },
    {
      "<S-F2>",
      function() require("which-key").show({ global = false }) end,
      mode = { "n", "i", "v", "x", "o", "t" },
      desc = "Show keys (buffer) [which-key]",
    },
  },

  --- @type wk.Opts
  opts = {
    preset = "helix",

    sort = {
      "order",
      "alphanum",
      function(item)
        return item.raw_key:find("^<.*>$") and 1 or 0
      end,
    },

    --- @type number|fun(node: wk.Node):boolean?
    expand = function(node)
      return not node.desc
    end,

    --- @param mapping wk.Mapping
    filter = function(mapping)
      if mapping.rhs and type(mapping.rhs) == "string" then
        -- nvim-surround
        if mapping.rhs:match("nvim%-surround") then
          mapping.desc = mapping.rhs .. " [surround]"
          return true
        end

        -- mini.nvim
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
      width = {
        min = 30,
        max = 100,
      },
    },

    layout = {
      width = {
        min = 80,
      },
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
        { pattern = "%[csvview%]", icon = " csvview", color = "blue" },
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
        { pattern = "%[multicursor%]", icon = " multicursor", color = "green" },
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
        { pattern = "%[snacks%]", icon = "󰉚 snacks", color = "purple" },
        { pattern = "%[surround%]", icon = "󰅲 surround", color = "green" },
        { pattern = "%[telescope%]", icon = " telescope", color = "cyan" },
        { pattern = "%[toggleterm%]", icon = "  toggleterm", color = "purple" },
        { pattern = "%[treesitter%-textsubjects%]", icon = "󱁉 textsubjects", color = "yellow" },
        { pattern = "%[treesj%]", icon = " treesj", color = "green" },
        { pattern = "%[trouble%]", icon = "󰙅 trouble", color = "red" },
        { pattern = "%[tssorter%]", icon = "  tssorter", color = "green" },
        { pattern = "%[ufo%]", icon = " ufo", color = "blue" },
        { pattern = "%[various%-textobjs%]", icon = " various-textobjs", color = "yellow" },
        { pattern = "%[which%-key%]", icon = " ", color = "grey" },
        { pattern = "%[yanky%]", icon = "󰆏 yanky", color = "green" },
        { pattern = "%[yazi%]", icon = "󰙅 yazi", color = "purple" },
      },
    },

    replace = {
      key = {
        { "<NL>", "<C-j>" },
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
      { "<Leader>d", group = "Diff" },
      { "<Leader>f", group = "Find" },
      { "<Leader>g", group = "Git" },
      { "<Leader>go", group = "Octo [octo]" },
      { "<Leader>l", group = "LSP [lsp]" },
      { "<Leader>u", group = "UI/toggles" },
      { "<Leader>w", group = "Windows" },
      { "<Leader>x", group = "Diagnostics/quickfix" },
      { "'", group = "Marks" },
      { ",", group = "Misc" },
      { "<C-w>", group = "Windows" },
      { "[", group = "Previous", mode = { "n", "v", "x", "o" } },
      { "\"", group = "Registers" },
      { "]", group = "Next", mode = { "n", "v", "x", "o" } },
      { "`", group = "Marks" },
      { "c", group = "Code", mode = { "o", "x" } },
      { "g", group = "Goto/operators" },
      { "gp", group = "Goto preview" },
      { "z", group = "Fold/scroll" },
      { "|", group = "External commands" },

      -- Normal mode
      {
        mode = "n",
        { "<Leader>L", "<CMD>Lazy sync<CR>", desc = "Plugins [lazy]" },
        { "<Leader>C", "<CMD>:e $MYVIMRC<CR>", desc = "Edit configuration [which-key]" },
        { "<Leader>W", function() require("which-key").show({ keys = "<C-w>", loop = true }) end, desc = "Windows (hydra mode)" },
        { "<Leader>O", "<CMD>:e ~/Vaults/Notes<CR>", desc = "Notes [obsidian]" },
        { "<C-,>", "<CMD>:e $MYVIMRC<CR>", desc = "Edit configuration [which-key]" },
        { "<Leader>q", "<CMD>qa<CR>", desc = "Quit all [which-key]" },
        { "<BS>", '<CMD>noh | echon ""<CR>', desc = "Clear search highlighting [which-key]" },
        { "<Esc>", '<CMD>noh | echon ""<CR><Esc>', desc = "Clear search highlighting [which-key]" },
        { "<C-s>", "<CMD>w!<CR>", desc = "Save [which-key]" },
        { "<C-g>", "2<C-g>", desc = "Print current file name [which-key]" },
        { "<S-C-k>", "dd", desc = "Delete line [which-key]" },

        {
          "<C-q>",
          function() return vim.cmd.normal({ vim.fn.reg_recording() == "" and "qq" or "q", bang = true }) end,
          desc = "Start/stop macro recording [which-key]",
        },
        { "@", "Q", desc = "Play macro [which-key]" },
        { "'", "`", desc = "Jump to mark [which-key]" },
        { "`", "'", desc = "Jump to mark [which-key]" },
        { ";", function() vim.cmd("normal! i" .. vim.fn.nr2char(vim.fn.getchar())) end, desc = "Insert single character [which-key]" },

        -- Insert blank lines
        { "<Leader><Enter>", "<CMD>put! =repeat(nr2char(10), v:count1)|silent ']+<CR>k", desc = "Add blank line on current line [which-key]" },
        { "<S-Enter>", "<CMD>put! =repeat(nr2char(10), v:count1)|silent ']+<CR>k", desc = "Add blank line on current line [which-key]" },
        -- { "[<Space>", "<CMD>put! =repeat(nr2char(10), v:count1)|silent ']+<CR>", desc = "Add blank line above [which-key]" },
        -- { "]<Space>", "<CMD>put =repeat(nr2char(10), v:count1)|silent '[-<CR>", desc = "Add blank line below [which-key]" },

        -- Better motions with word wrap on
        { "j", "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Line down [which-key]" },
        { "k", "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Line up [which-key]" },

        -- Single key indent
        { "<lt>", "<lt><lt>", desc = "Decrease indent [which-key]" },
        { ">", ">>", desc = "Increase indent [which-key]" },
        { "=", "==", desc = "Reindent line [which-key]" },

        -- Buffers
        { "<A-w>", "<C-^>", desc = "Alternate buffer [which-key]" },
        { "<S-h>", "<CMD>bprevious<CR>", desc = "Previous buffer [which-key]" },
        { "<S-l>", "<CMD>bnext<CR>", desc = "Next buffer [which-key]" },
        { "q", function() winbuf.close_window_or_buffer() end, desc = "Delete buffer/close window [which-key]" },
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
          "<Leader>ba",
          function()
            winbuf.buffers_run(
              { normal = true, listed = true },
              function(bufnr)
                vim.cmd.bdelete(bufnr)
              end
            )
          end,
          desc = "Delete all buffers [which-key]",
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
        {
          "<Leader>bi",
          function() show(vim.fn.getbufinfo(vim.api.nvim_get_current_buf()), { title = "Current buffer" }) end,
          desc = "Show current buffer info [which-key]",
        },
        { "<Leader>bI", function() show(vim.fn.getbufinfo(), { title = "All Buffers" }) end, desc = "Show all buffers info [which-key]" },


        -- Window opening/closing
        { "<Leader>-", "<CMD>new<CR>", desc = "Open new file in split [which-key]" },
        { "<Leader><Leader>-", "<CMD>split<CR>", desc = "Open current file in split [which-key]" },
        { "<Leader><Leader>\\", "<CMD>vsplit<CR>", desc = "Open current file in vsplit [which-key]" },
        { "<Leader>\\", "<CMD>vnew<CR>", desc = "Open new file in vsplit [which-key]" },
        { "<Leader>wT", "<C-w>T", desc = "Open current window in new tab [which-key]" },
        { "<Leader>w]", "<C-w>]", desc = "Go to identifier in split [which-key]" },
        { "<Leader>w\\", "<CMD>vertical wincmd ]<CR>", desc = "Go to identifier in vertical split [which-key]" },
        { "<Leader>wc", "<C-w>c", desc = "Close current window [which-key]" },
        {
          "<Leader>wi",
          function() show(vim.fn.getwininfo(vim.api.nvim_get_current_win()), { title = "Current window" }) end,
          desc = "Show current window info [which-key]",
        },
        { "<Leader>wI", function() show(vim.fn.getwininfo(), { title = "All Windows" }) end, desc = "Show all windows info [which-key]" },
        { "<Leader>wo", "<C-w>o", desc = "Make current window the only one [which-key]" },
        { "<Leader>wq", "<C-w>q", desc = "Quit window [which-key]" },
        { "<Leader>ws", "<C-w>s", desc = "Split window (horizontal) [which-key]" },
        { "<Leader>wv", "<C-w>v", desc = "Split window (vertical) [which-key]" },
        { "<Leader>wz", "<C-w>z", desc = "Close preview window [which-key]" },
        { "<Leader>w}", "<C-w>}", desc = "Go to identifier in preview [which-key]" },
        { "<Leader>wx", "<C-w>x", desc = "Exchange current window with next [which-key]" },
        { "<Leader>wa", "<C-^>", desc = "Edit alternate buffer in current window [which-key]" },
        { "<Leader>wA", "<C-w>^", desc = "Edit alternate buffer in split [which-key]" },
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
        { "<C-h>", "<C-w>h", desc = "Left one window [which-key]" },
        { "<C-j>", "<C-w>j", desc = "Down one window [which-key]" },
        { "<C-k>", "<C-w>k", desc = "Up one window [which-key]" },
        { "<C-l>", "<C-w>l", desc = "Right one window [which-key]" },
        { "<Leader>wh", "<C-w>h", desc = "Left one window [which-key]" },
        { "<Leader>wj", "<C-w>j", desc = "Up one window [which-key]" },
        { "<Leader>wk", "<C-w>k", desc = "Down one window [which-key]" },
        { "<Leader>wl", "<C-w>l", desc = "Right one window [which-key]" },
        { "<Leader>wH", "<C-w>H", desc = "Move current window to left [which-key]" },
        { "<Leader>wJ", "<C-w>J", desc = "Move current window to bottom [which-key]" },
        { "<Leader>wK", "<C-w>K", desc = "Move current window to top [which-key]" },
        { "<Leader>wL", "<C-w>L", desc = "Move current window to right [which-key]" },
        { "<Leader>wR", "<C-w>R", desc = "Rotate windows upwards/leftwards [which-key]" },
        { "<Leader>wW", "<C-w>W", desc = "Previous window [which-key]" },
        { "<Leader>ww", "<C-w><C-w>", desc = "Next window [which-key]" },
        { "<Leader>wr", "<C-w>r", desc = "Rotate windows downwards/rightwards [which-key]" },

        -- Window size
        { "<Leader>w|", "<C-w>|", desc = "Maximize window width [which-key]" },
        { "<Leader>w=", "<C-w>=", desc = "Make windows equally high and wide [which-key]" },
        { "<Leader>w_", "<C-w>_", desc = "Maximize window height [which-key]" },
        { "<S-C-Down>", "<CMD>resize -2<CR>", desc = "Decrease window height [which-key]" },
        { "<S-C-Left>", "<CMD>vertical resize -2<CR>", desc = "Decrease window width [which-key]" },
        { "<S-C-Right>", "<CMD>vertical resize +2<CR>", desc = "Increase window width [which-key]" },
        { "<S-C-Up>", "<CMD>resize +2<CR>", desc = "Increase window height [which-key]" },

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
        { "z.", function() util.close_folds_with_level(vim.fn.foldlevel(".")) end, desc = "Close folds with current line level [which-key]" },
        { "z1", function() util.close_folds_with_level(1) end, desc = "Close folds with level 1 [which-key]" },
        { "z2", function() util.close_folds_with_level(2) end, desc = "Close folds with level 2 [which-key]" },
        { "z3", function() util.close_folds_with_level(3) end, desc = "Close folds with level 3 [which-key]" },
        { "z4", function() util.close_folds_with_level(4) end, desc = "Close folds with level 4 [which-key]" },

        -- Code
        { "<Leader>ci", function() vim.show_pos() end, desc = "Inspect under cursor [which-key]" },
        { "<Leader>cI", function() vim.treesitter.inspect_tree() end, desc = "Inspect treesitter tree [which-key]" },

        { ",.", "<C-u>", desc = "Scroll up [which-key]" },
        { ",/", "<C-d>", desc = "Scroll down [which-key]" },
        { ",[", "<C-t>", desc = "Pop tag from stack [which-key]" },
        { ",]", "<C-]>", desc = "Jump to tag [which-key]" },
        { ",cd", "<CMD>cd %:h<CR>", desc = "Change current working directory to current file directory [which-key]" },
        { ",r", "<C-r>", desc = "Redo last change [which-key]" },
        { ",vb", "<C-v>", desc = "Visual block mode [which-key]" },
        { ",cr", "<CMD>%!dos2unix<CR>", desc = "Convert line endings to CR [which-key]" },
        -- { ",t", [[/\([^A-Za-z][A-Za-z]\w\+\s\)\@<=[A-Z]<CR>]], desc = "Find title case word [which-key]" },
        { ",t", [[/\(\w\(\/\|\s\)\)\@<=[A-Z]<CR>]], desc = "Find title case word [which-key]" },

        -- Diff
        { "<Leader>dd", "<CMD>diffthis<CR>", desc = "Diff this [which-key]" },
        { "<Leader>dg", "<CMD>diffthis<CR>", desc = "Diff get [which-key]" },
        { "<Leader>do", "<CMD>diffoff<CR>", desc = "Diff off [which-key]" },
        { "<Leader>dO", "<CMD>diffoff<CR>", desc = "Diff off all [which-key]" },
        { "<Leader>dp", "<CMD>diffthis<CR>", desc = "Diff put [which-key]" },
        { "<Leader>dt", "<CMD>diffthis<CR>", desc = "Diff this [which-key]" },
        { "<Leader>du", "<CMD>diffupdate<CR>", desc = "Diff update [which-key]" },

        -- Yank/paste
        { "Y", "_y$", desc = "Yank line characters [which-key]" },
        { "<S-Insert>", '"+P', desc = "Paste from system clipboard [which-key]" },
        { "gp", "'`[' . getregtype()[0] . '`]'", desc = "Select last pasted text [which-key]", expr = true },

        -- External commands
        { "|sd", "<CMD>silent !sops decrypt -i %<CR>", desc = "SOPS decrypt [which-key]" },
        { "|se", "<CMD>silent !sops encrypt -i %<CR>", desc = "SOPS encrypt [which-key]" },
        { "|x12", "<CMD>%!x12pp<CR><CMD>set ft=x12<CR>", desc = "Format X12 file [which-key]" },
      },

      -- Normal and visual mode
      {
        mode = { "n", "x" },

        -- Motions
        -- { "b", [[<CMD>call search('\<', 'b')<CR>]], desc = "Previous word [which-key]" },
        -- { "e", [[<CMD>call search('\>')<CR>]], desc = "Next end of word [which-key]" },
        -- { "ge", [[<CMD>call search('\>', 'b')<CR>]], desc = "Previous end of word [which-key]" },
        -- { "w", [[<CMD>call search('\<')<CR>]], desc = "Next word [which-key]" },
        { "{", [[<CMD>call search('\({\_s*\)\@<=\S', 'b')<CR>]], desc = "Previous character after { [which-key]" },
        { "}", [[<CMD>call search('\({\_s*\)\@<=\S')<CR>]], desc = "Next character after { [which-key]" },
        -- { "}", [[<CMD>call search('}')<CR>]], desc = "Next } [which-key]" },
        { "(", [[<CMD>call search('\((\_s*\)\@<=\S', 'b')<CR>]], desc = "Previous character after ( [which-key]" },
        { ")", [[<CMD>call search('\((\_s*\)\@<=\S')<CR>]], desc = "Next character after ( [which-key]" },
        -- { ")", [[<CMD>call search(')')<CR>]], desc = "Next ) [which-key]" },
      },

      -- Insert mode
      {
        mode = "i",
        { "<Esc>", "<Esc>`^", desc = "Exit insert mode [which-key]" },
        { "<C-s>", "<Esc>`^<CMD>w!<CR>", desc = "Save [which-key]" },
        { "<C-BS>", "<C-w>", desc = "Delete previous word [which-key]" },
        { "<C-h>", "<C-w>", desc = "Delete previous word [which-key]" },
        { "<A-h>", "<Left>", noremap = false, desc = "Left [which-key]" },
        { "<A-j>", "<Down>", noremap = false, desc = "Down [which-key]" },
        { "<A-k>", "<Up>", noremap = false, desc = "Up [which-key]" },
        { "<A-l>", "<Right>", noremap = false, desc = "Right [which-key]" },
        { "<A-p>", "<C-o>P", noremap = false, desc = "Paste [which-key]" },
        { "<A-x>", "<C-o>x", noremap = false, desc = "Delete character under cursor [which-key]" },
        { "<A-X>", "<C-o>X", noremap = false, desc = "Delete character before cursor [which-key]" },
        { "<S-C-k>", "<C-o>dd", desc = "Delete line [which-key]" },
        { "<S-Enter>", "<Esc>m`O<Esc>``a", desc = "Insert blank line above [which-key]" },
        { "<C-Enter>", "<Esc>m`o<Esc>``a", desc = "Insert blank line below [which-key]" },
        { "<S-Insert>", "<C-r><C-o>+", desc = "Paste from system clipboard [which-key]" },
      },

      -- Visual and select mode
      {
        mode = "v",
        { "<C-s>", "<Esc><CMD>w!<CR>", desc = "Save [which-key]" },
        { "<C-Insert>", '"+y', desc = "Yank to system clipboard [which-key]" },
        { "<S-Insert>", '"+P', desc = "Paste from system clipboard [which-key]" },
      },

      -- Visual mode
      {
        mode = "x",
        { "<Leader>sl", ":sort i<CR>", desc = "Sort lines [which-key]" },
        { "<Leader>sn", ":sort in<CR>", desc = "Sort lines by number [which-key]" },
        { "<Leader>su", ":sort iu<CR>", desc = "Sort lines unique [which-key]" },
        { "<lt>", "<lt>gv", desc = "Decrease indent [which-key]" },
        { ">", ">gv", desc = "Increase indent [which-key]" },
        { ",.", "<C-u>", desc = "Scroll up [which-key]" },
        { ",/", "<C-d>", desc = "Scroll down [which-key]" },
      },

      -- Terminal mode
      {
        mode = "t",
        { "<C-h>", "<C-\\><C-n><C-w>h", desc = "Left one window [which-key]" },
        { "<C-j>", "<C-\\><C-n><C-w>j", desc = "Down one window [which-key]" },
        { "<C-k>", "<C-\\><C-n><C-w>k", desc = "Up one window [which-key]" },
        { "<C-l>", "<C-\\><C-n><C-w>l", desc = "Right one window [which-key]" },
        { "<C-BS>", "<C-h>", desc = "Delete previous word [which-key]" },
        { "<S-Enter>", "<Enter>", desc = "Insert enter [which-key]" },
        { "<S-Space>", "<Space>", desc = "Insert space [which-key]" },
        { "<S-Esc>", "<C-\\><C-n>", desc = "Go to normal mode [which-key]" },
        { "<S-Insert>", '<C-\\><C-n>"+pi', desc = "Paste from system clipboard [which-key]" },
      },

      -- Cmdline mode
      {
        mode = "c",
        { "<S-Insert>", "<C-r><C-r>+", desc = "Paste from system clipboard [which-key]", silent = false },
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
