local yank_all_entries = function(prompt_bufnr)
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local entry_display = require("telescope.pickers.entry_display")
  local picker = action_state.get_current_picker(prompt_bufnr)
  local manager = picker.manager
  local entries = {}
  for entry in manager:iter() do
    local display, _ = entry_display.resolve(picker, entry)
    table.insert(entries, display)
  end
  actions.close(prompt_bufnr)
  vim.fn.setreg("", table.concat(entries, "\n"))
end

local yank_preview_lines = function(prompt_bufnr)
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local picker = action_state.get_current_picker(prompt_bufnr)
  local lines = vim.api.nvim_buf_get_lines(picker.previewer.state.bufnr, 0, -1, false)
  local text = table.concat(lines, "\n")
  actions.close(prompt_bufnr)
  vim.fn.setreg("", text)
end

local cursor_theme = function(opts)
  return require("telescope.themes").get_cursor(
    vim.tbl_deep_extend("force", { layout_config = { height = 20, width = 80 } }, opts)
  )
end

return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",

  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "fdschmidt93/telescope-egrepify.nvim",
    "jvgrootveld/telescope-zoxide",
    "debugloop/telescope-undo.nvim",
    "Marskey/telescope-sg",

    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
  },

  keys = {
    { "<Leader>f.", function() require("telescope").extensions.file_browser.file_browser() end, desc = "Browse files" },
    {
      "<Leader>f/",
      function() require("telescope.builtin").current_buffer_fuzzy_find() end,
      desc = "Current buffer fuzzy find",
    },
    { "<Leader>fA", function() require("telescope.builtin").ast_grep() end, desc = "ast-grep" },
    { "<Leader>fC", function() require("telescope.builtin").autocommands() end, desc = "Autocommands" },
    { "<Leader>fh", function() require("telescope.builtin").highlights() end, desc = "Highlights" },
    { "<Leader>fM", function() require("telescope.builtin").man_pages() end, desc = "Man pages" },
    { "<Leader>fR", function() require("telescope.builtin").registers() end, desc = "Registers" },
    { "<Leader>fa", function() require("telescope.builtin").builtin() end, desc = "All" },
    { "<Leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
    { "<Leader>fc", function() require("telescope.builtin").commands() end, desc = "Commands" },
    { "<Leader>fd", function() require("telescope.builtin").lsp_definitions() end, desc = "LSP definitions" },
    { "<Leader>ff", function() require("telescope.builtin").find_files() end, desc = "Files" },
    {
      "<Leader>fF",
      function()
        require("telescope.builtin").find_files({
          find_command = {
            "fd",
            "--hidden",
            "--no-ignore",
          },
        })
      end,
      desc = "Files (all)",
    },
    { "<Leader>fH", function() require("telescope.builtin").help_tags() end, desc = "Help" },
    { "<Leader>fk", function() require("telescope.builtin").keymaps() end, desc = "Keymaps" },
    {
      "<Leader>fl",
      function() require("telescope.builtin").find_files({ cwd = require("telescope.utils").buffer_dir() }) end,
      desc = "Files from current directory",
    },
    { "<Leader>fn", function() require("telescope").extensions.noice.noice() end, desc = "Noice" },
    { "<Leader>fo", function() require("telescope.builtin").vim_options() end, desc = "Vim options" },
    { "<Leader>fr", function() require("telescope.builtin").oldfiles() end, desc = "Recent files" },
    { "<Leader>fs", function() require("telescope.builtin").symbols(cursor_theme({})) end, desc = "Symbols" },
    { "<Leader>ft", function() require("telescope").extensions.egrepify.egrepify() end, desc = "Text" },
    {
      "<Leader>fT",
      function()
        require("telescope").extensions.egrepify.egrepify({
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--multiline",
            "--hidden",
            "--no-ignore",
          },
        })
      end,
      desc = "Text (all files)",
    },
    { "<Leader>fu", function() require("telescope").extensions.undo.undo() end, desc = "Undo" },
    { "<Leader>fw", function() require("telescope.builtin").grep_string() end, desc = "Word" },
    {
      "<Leader>fy",
      function() require("telescope").extensions.yank_history.yank_history({}) end,
      desc = "Yank History",
    },
    { "<Leader>fz", function() require("telescope").extensions.zoxide.list() end, desc = "Zoxide" },
    { "<Leader>gS", function() require("telescope.builtin").git_stash() end, desc = "Git stash" },
    { "<Leader>gb", function() require("telescope.builtin").git_branches() end, desc = "Branches" },
    { "<Leader>gc", function() require("telescope.builtin").git_commits() end, desc = "Commits" },
    { "<Leader>gC", function() require("telescope.builtin").git_bcommits() end, desc = "Buffer commits" },
    { "<Leader>gs", function() require("telescope.builtin").git_status() end, desc = "Status" },
    { mode = { "n", "i", "x" }, "<F1>", function() require("telescope.builtin").help_tags() end, desc = "Help" },

    -- Select directories containing .git in the specified search_dirs.
    -- The default select action will change the default directory and open oil.
    {
      "<Leader>fp",
      function()
        require("telescope.builtin").find_files({
          cwd = vim.env.HOME,
          find_command = {
            "fd",
            "--prune",
            "--hidden",
            "--case-sensitive",
            "--absolute-path",
            "--no-ignore",
            "-td",
            "-x",
            "echo",
            "{//}",
            ";",
          },
          file_ignore_patterns = { "%.cache", "%.cargo" },
          attach_mappings = function(prompt_bufnr, _map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            actions.select_default:replace(function()
              actions.close(prompt_bufnr)
              local dir = action_state.get_selected_entry()[1]
              vim.cmd.lcd(dir)
              require("oil").open(dir)
            end)
            return true
          end,
          search_file = "^\\.git$",
          search_dirs = (vim.fn.has("win32") == 1)
              and { "D:/Code", "~/AppData/Local/nvim-data", "~/AppData/Local/nvim" }
            or { "~/" },
        })
      end,
      desc = "Projects",
    },
  },

  opts = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        winblend = 0,
        layout_config = {
          prompt_position = "top",
          horizontal = {
            preview_width = 0.6,
            height = 0.8,
            width = 0.9,
          },
        },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        prompt_prefix = " ",
        sorting_strategy = "ascending",
        selection_caret = " ",
        path_display = { "truncate" },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--multiline",
          "--hidden",
        },
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-c>"] = false,
            ["<F1>"] = actions.which_key,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-y>e"] = yank_all_entries,
            ["<C-y>p"] = yank_preview_lines,
          },
          n = {
            ["<F1>"] = actions.which_key,
            ["<C-y>e"] = yank_all_entries,
            ["<C-y>p"] = yank_preview_lines,
          },
        },
      },

      pickers = {
        builtin = {
          include_extensions = true,
        },
        find_files = {
          find_command = {
            "fd",
            "--hidden",
            "--exclude",
            ".git",
            "--exclude",
            "node_modules",
          },
        },
        lsp_references = {
          include_declaration = false,
          include_current_line = false,
        },
        keymaps = {
          filter = function(km)
            -- Hide which-key keymaps
            return not km.lhs:match("Þ$") and (not km.rhs or not km.rhs:match("which%-key"))
          end,
        },
        symbols = cursor_theme({}),
      },

      extensions = {
        ast_grep = {
          command = {
            "ast-grep",
            "--json=stream",
          },
          grep_open_files = false,
          lang = nil,
        },
        egrepify = {
          title = false,
        },
        undo = {
          use_delta = false,
        },
      },
    }
  end,

  config = function(_, opts)
    local telescope = require("telescope")
    local utils = require("telescope.utils")

    local transform_path = utils.transform_path
    ---@diagnostic disable-next-line: duplicate-set-field
    utils.transform_path = function(opts2, path)
      path = require("util").normalize_path(path)
      return transform_path(opts2, path)
    end

    local is_uri = utils.is_uri
    ---@diagnostic disable-next-line: duplicate-set-field
    utils.is_uri = function(filename)
      if filename:sub(2, 2) == ":" then return false end
      return is_uri(filename)
    end

    telescope.setup(opts)
    telescope.load_extension("ast_grep")
    telescope.load_extension("egrepify")
    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")
    telescope.load_extension("scope")
    telescope.load_extension("undo")
    telescope.load_extension("zoxide")

    vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "Title" })

    local colors = require("util.colors")
    local hl_cursorline = vim.api.nvim_get_hl(0, { name = "CursorLine" })
    colors.mod_hl("TelescopeSelection", { bg = hl_cursorline.bg })
  end,
}
