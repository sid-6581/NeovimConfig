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

return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",

  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "jvgrootveld/telescope-zoxide",
    "debugloop/telescope-undo.nvim",
    "Marskey/telescope-sg",
    "cljoly/telescope-repo.nvim",

    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
  },

  keys = {
    { "<F1>", "<CMD>Telescope help_tags<CR>", desc = "Help" },
    { mode = "i", "<F1>", "<CMD>Telescope help_tags<CR>", desc = "Help" },
    { "<Leader>f/", "<CMD>Telescope current_buffer_fuzzy_find<CR>", desc = "Current buffer fuzzy find" },
    { "<Leader>fa", "<CMD>Telescope builtin include_extensions=true<CR>", desc = "All" },
    { "<Leader>fA", "<CMD>Telescope ast_grep<CR>", desc = "ast-grep" },
    { "<Leader>fb", "<CMD>Telescope buffers<CR>", desc = "Buffers" },
    { "<Leader>fc", "<CMD>Telescope commands<CR>", desc = "Commands" },
    { "<Leader>ff", "<CMD>Telescope find_files<CR>", desc = "Files" },
    { "<Leader>fg", "<CMD>Telescope git_branches<CR>", desc = "Git branches" },
    { "<Leader>fh", "<CMD>Telescope help_tags<CR>", desc = "Help" },
    { "<Leader>fk", "<CMD>Telescope keymaps<CR>", desc = "Keymaps" },
    {
      "<Leader>fl",
      function()
        require("telescope.builtin").find_files({
          cwd = require("telescope.utils").buffer_dir(),
        })
      end,
      desc = "Files from current directory",
    },
    { "<Leader>fM", "<CMD>Telescope man_pages<CR>", desc = "Man pages" },
    { "<Leader>fn", "<CMD>Noice telescope<CR>", desc = "Noice" },
    { "<Leader>fr", "<CMD>Telescope oldfiles<CR>", desc = "Recent files" },
    { "<Leader>fp", "<CMD>Telescope repo list<CR>", desc = "Projects" },
    { "<Leader>fR", "<CMD>Telescope registers<CR>", desc = "Registers" },
    { "<Leader>fs", "<CMD>Telescope symbols<CR>", desc = "Symbols" },
    { "<Leader>ft", "<CMD>Telescope live_grep<CR>", desc = "Text" },
    { "<Leader>fu", "<CMD>Telescope undo<CR>", desc = "Undo" },
    { "<Leader>fw", "<CMD>Telescope grep_string<CR>", desc = "Word" },
    { "<Leader>fz", "<CMD>Telescope zoxide list<CR>", desc = "Zoxide" },
    { "<Leader>f.", "<CMD>Telescope file_browser<CR>", desc = "Browse files" },
    { "<Leader>gb", "<CMD>Telescope git_branches<CR>", desc = "Branches" },
    { "<Leader>gc", "<CMD>Telescope git_commits<CR>", desc = "Commits" },
    { "<Leader>go", "<CMD>Telescope git_status<CR>", desc = "Status" },
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        winblend = 10,
        layout_config = {
          horizontal = {
            preview_width = 0.6,
            width = 0.9,
          },
        },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        prompt_prefix = " ",
        selection_caret = " ",
        -- path_display = { "smart" },
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
        find_files = {
          find_command = { "fd", "--hidden", "--exclude", ".git", "--glob", "" },
        },
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
        repo = {
          list = {
            fd_opts = "--no-ignore",
            file_ignore_patterns = { "/%.cache/", "/%.cargo/" },
            search_dirs = (vim.fn.has("win32") == 1) and { "D:/Code", "E:/", "~/AppData/Local/" } or { "~" },
          },
        },
        undo = {
          use_delta = false,
        },
      },
    })

    telescope.load_extension("ast_grep")
    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")
    telescope.load_extension("repo")
    telescope.load_extension("scope")
    telescope.load_extension("undo")
    telescope.load_extension("zoxide")

    vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "Title" })
  end,
}
