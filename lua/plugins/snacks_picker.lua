local M = {}

M.spec = {
  "folke/snacks.nvim",
  event = "VeryLazy",
  keys = {
    { "<A-1>", function() require("snacks").explorer() end, desc = "File explorer [snacks]" },
    { "<C-.>", function() require("snacks").picker.files() end, desc = "Search files [snacks]" },
    { "<C-/>", function() require("snacks").picker.grep() end, desc = "Search text [snacks]" },
    { "<F1>", function() require("snacks").picker.help() end, mode = { "n", "i", "v", "x", "o", "c" }, desc = "Search help [snacks]" },
    { "<F3>", function() require("snacks").picker.keymaps() end, mode = { "n", "i", "v", "x", "o", "c" }, desc = "Search keymaps [snacks]" },
    { "<Leader>f:", function() require("snacks").picker.command_history() end, desc = "Search command history [snacks]" },
    { "<Leader>f/", function() require("snacks").picker.lines() end, desc = "Search buffer lines [snacks]" },
    { "<Leader>fa", function() require("snacks").picker.pick() end, desc = "Search pickers [snacks]" },
    { "<Leader>fC", function() require("snacks").picker.autocmds() end, desc = "Search autocommands [snacks]" },
    { "<Leader>fl", function() require("snacks").picker.loclist() end, desc = "Search loclist [snacks]" },
    { "<Leader>fL", function() require("snacks").picker.lazy() end, desc = "Search for Lazy plugin spec [snacks]" },
    { "<Leader>fR", function() require("snacks").picker.resume() end, desc = "Search resume [snacks]" },
    { "<Leader>fS", function() require("snacks").picker.icons() end, desc = "Search symbols [snacks]" },
    { "<Leader>fb", function() require("snacks").picker.buffers() end, desc = "Search buffers [snacks]" },
    { "<Leader>fc", function() require("snacks").picker.commands() end, desc = "Search commands [snacks]" },
    { "<Leader>fe", function() require("snacks").explorer() end, desc = "File explorer [snacks]" },
    { "<Leader>ff", function() require("snacks").picker.files() end, desc = "Search files [snacks]" },
    { "<Leader>fg", function() require("snacks").picker.git_status() end, desc = "Search git status [snacks]" },
    { "<Leader>fh", function() require("snacks").picker.highlights() end, desc = "Search highlights [snacks]" },
    { "<Leader>fj", function() require("snacks").picker.jumps() end, desc = "Search jumps [snacks]" },
    { "<Leader>fk", function() require("snacks").picker.keymaps() end, desc = "Search keymaps [snacks]" },
    { "<Leader>fn", function() require("snacks").picker.notifications() end, desc = "Search notification history [snacks]" },
    { "<Leader>fp", function() require("snacks").picker.projects() end, desc = "Search projects [snacks]" },
    { "<Leader>fr", function() require("snacks").picker.recent() end, desc = "Search recent [snacks]" },
    { "<Leader>fs", function() require("snacks").picker.grep() end, desc = "Search text [snacks]" },
    { "<Leader>fu", function() require("snacks").picker.undo() end, desc = "Search undo history [snacks]" },
    { "<Leader>fw", function() require("snacks").picker.grep_word() end, mode = { "n", "x" }, desc = "Search for word [snacks]" },
    { "<Leader>fo", function() M.options_picker() end, mode = { "n", "x" }, desc = "Search for options [snacks]" },
  },

  --- @type snacks.Config
  --- @diagnostic disable-next-line: missing-fields
  opts = {
    picker = {
      enabled = true,

      main = {
        current = true,
      },

      formatters = {
        file = {
          truncate = 80,
        },
      },

      layouts = {
        default = {
          layout = {
            box = "horizontal",
            width = 0.9,
            min_width = 120,
            height = 0.9,
            {
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            { win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
          },
        },

        sidebar = {
          preview = "main",
          layout = {
            width = 40,
            min_width = 40,
            height = 0,
            position = "left",
            title = "{title} {live} {flags}",
            title_pos = "center",
            border = "top",
            box = "vertical",
            {
              win = "input",
              height = 1,
              border = "bottom",
            },
            { win = "list", border = "none" },
            { win = "preview", title = "{preview}", height = 0.4, border = "top" },
          },
        },

        vscode = {
          preview = false,
          layout = {
            width = 0.5,
            min_width = 80,
            height = 0.4,
            min_height = 3,
            box = "vertical",
            border = "rounded",
            title = "{title}",
            title_pos = "center",
            { win = "input", height = 1, border = "bottom" },
            { win = "list", border = "none" },
            { win = "preview", title = "{preview}", height = 0.4, border = "top" },
          },
        },
      },

      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          diagnostics_open = true,
          git_status_open = true,

          exclude = {
            ".git",
            "node_modules",
          },

          win = {
            input = {
              keys = {
                ["<Esc>"] = { "focus_list", mode = { "n", "i" } },
                ["<C-t>"] = { "edit_tab", mode = { "n", "i" } },
              },
            },
            list = {
              keys = {
                ["<Esc>"] = false,
                ["<C-t>"] = "edit_tab",
                ["/"] = false,
              },
            },
          },
        },

        files = {
          hidden = true,
        },

        grep = {
          hidden = true,
        },

        keymaps = {
          format = function(item, picker) return M.keymap_format(item, picker) end,
        },

        projects = {
          confirm = { "tcd", "picker_files" },
          dev = vim.fn.has("win32") == 1
            and {
              "~/.local/share/nvim-data/lazy",
              "~/.dotfiles",
              --- @diagnostic disable-next-line: param-type-mismatch
              unpack(vim.fn.expand("D:/Code/*", nil, true)),
            }
            or {
              "~/.local/share/nvim/lazy",
              --- @diagnostic disable-next-line: param-type-mismatch
              unpack(vim.fn.expand("~/Code/*", nil, true)),
            },
        },
      },

      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["<F1>"] = { "toggle_help_input", mode = { "n", "i" } },
            ["<C-t>"] = { "edit_tab", mode = { "n", "i" } },
          },
        },
        list = {
          keys = {
            ["<Esc>"] = "close",
            ["<F1>"] = "toggle_help_input",
            ["<C-t>"] = "edit_tab",
          },
        },
      },
    },
  },
}

M.keymap_format = function(item, picker)
  local ret = {} --- @type snacks.picker.Highlight[]
  local k = item.item
  local a = require("snacks").picker.util.align

  if package.loaded["which-key"] then
    local Icons = require("which-key.icons")
    local icon, hl = Icons.get({ keymap = k, desc = k.desc })
    if icon then
      ret[#ret + 1] = { a(icon, 20), hl }
    else
      ret[#ret + 1] = { "                    " }
    end
  end

  local lhs = require("snacks").util.normkey(k.lhs)
  ret[#ret + 1] = { k.mode, "SnacksPickerKeymapMode" }
  ret[#ret + 1] = { " " }
  ret[#ret + 1] = { a(lhs, 15), "SnacksPickerKeymapLhs" }
  ret[#ret + 1] = { " " }
  local icon_nowait = picker.opts.icons.keymaps.nowait

  if k.nowait == 1 then
    ret[#ret + 1] = { icon_nowait, "SnacksPickerKeymapNowait" }
  else
    ret[#ret + 1] = { (" "):rep(vim.api.nvim_strwidth(icon_nowait)) }
  end

  ret[#ret + 1] = { " " }

  if k.buffer and k.buffer > 0 then
    ret[#ret + 1] = { a("buf:" .. k.buffer, 6), "SnacksPickerBufNr" }
  else
    ret[#ret + 1] = { a("", 6) }
  end

  ret[#ret + 1] = { " " }

  local rhs_len = 0
  if k.rhs and k.rhs ~= "" then
    local rhs = k.rhs or ""
    rhs_len = #rhs
    local cmd = rhs:lower():find("<cmd>")
    if cmd then
      ret[#ret + 1] = { rhs:sub(1, cmd + 4), "NonText" }
      rhs = rhs:sub(cmd + 5)
      local cr = rhs:lower():find("<cr>$")
      if cr then
        rhs = rhs:sub(1, cr - 1)
      end

      require("snacks").picker.highlight.format(item, rhs, ret, { lang = "vim" })
      if cr then
        ret[#ret + 1] = { "<CR>", "NonText" }
      end
    elseif rhs:lower():find("^<plug>") then
      ret[#ret + 1] = { "<Plug>", "NonText" }
      local plug = rhs:sub(7):gsub("^%(", ""):gsub("%)$", "")
      ret[#ret + 1] = { "(", "SnacksPickerDelim" }
      require("snacks").picker.highlight.format(item, plug, ret, { lang = "vim" })
      ret[#ret + 1] = { ")", "SnacksPickerDelim" }
    elseif rhs:find("v:lua%.") then
      ret[#ret + 1] = { "v:lua", "NonText" }
      ret[#ret + 1] = { ".", "SnacksPickerDelim" }
      require("snacks").picker.highlight.format(item, rhs:sub(7), ret, { lang = "lua" })
    else
      ret[#ret + 1] = { k.rhs, "SnacksPickerKeymapRhs" }
    end
  else
    ret[#ret + 1] = { "callback", "Function" }
    rhs_len = 8
  end

  if rhs_len < 15 then
    ret[#ret + 1] = { (" "):rep(15 - rhs_len) }
  end

  ret[#ret + 1] = { " " }
  ret[#ret + 1] = { a(k.desc or "", 20) }

  if item.file then
    ret[#ret + 1] = { " " }
    vim.list_extend(ret, require("snacks").picker.format.filename(item, picker))
  end

  return ret
end

M.options_picker = function()
  local options = {}
  for _, v in pairs(vim.api.nvim_get_all_options_info()) do
    local ok, value = pcall(vim.api.nvim_get_option_value, v.name, {})
    if ok then
      v.value = value
      table.insert(options, v)
    end
  end

  table.sort(options, function(left, right)
    return left.name < right.name
  end)

  local items = vim.tbl_map(
    function(option)
      return {
        text = string.format(
          "%-25s %-12s %-11s %s",
          option.name,
          option.type,
          option.scope,
          tostring(option.value)
        ),
        preview = {
          text = vim.inspect(option),
          ft = "lua",
        },
      }
    end,
    options
  )

  Snacks.picker.pick({
    title = "Options",
    format = "text",
    items = items,
    preview = "preview",
    confirm = { "copy", "close" },
  })
end

return M.spec
