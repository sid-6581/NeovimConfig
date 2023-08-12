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
  local previewer = picker.previewer
  local winid = previewer.state.winid
  local bufnr = previewer.state.bufnr
  local line_start = vim.fn.line("w0", winid)
  local line_end = vim.fn.line("w$", winid)
  local lines = vim.api.nvim_buf_get_lines(bufnr, line_start, line_end, false)
  local text = table.concat(lines, "\n")
  actions.close(prompt_bufnr)
  vim.fn.setreg("", text)
end

return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",

  keys = {
    { "<F1>", "<CMD>Telescope help_tags<CR>", desc = "Help" },
    { mode = "i", "<F1>", "<CMD>Telescope help_tags<CR>", desc = "Help" },
    { "<Leader>fM", "<CMD>Telescope man_pages<CR>", desc = "Man pages" },
    { "<Leader>fR", "<CMD>Telescope registers<CR>", desc = "Registers" },
    { "<Leader>fa", "<CMD>Telescope builtin include_extensions=true<CR>", desc = "All" },
    { "<Leader>fb", "<CMD>Telescope buffers<CR>", desc = "Buffers" },
    { "<Leader>fc", "<CMD>Telescope commands<CR>", desc = "Commands" },
    { "<Leader>ff", "<CMD>Telescope find_files<CR>", desc = "Files" },
    { "<Leader>fg", "<CMD>Telescope git_branches<CR>", desc = "Git branches" },
    { "<Leader>fh", "<CMD>Telescope help_tags<CR>", desc = "Help" },
    { "<Leader>fk", "<CMD>Telescope keymaps<CR>", desc = "Keymaps" },
    { "<Leader>fn", "<CMD>Noice telescope<CR>", desc = "Noice" },
    { "<Leader>fp", "<CMD>Telescope projects<CR>", desc = "Projects" },
    { "<Leader>fr", "<CMD>Telescope oldfiles<CR>", desc = "Recent files" },
    { "<Leader>fs", "<CMD>Telescope symbols<CR>", desc = "Symbols" },
    { "<Leader>ft", "<CMD>Telescope live_grep<CR>", desc = "Text" },
    { "<Leader>fu", "<CMD>Telescope undo<CR>", desc = "Undo" },
    { "<Leader>gb", "<CMD>Telescope git_branches<CR>", desc = "Checkout branch" },
    { "<Leader>gc", "<CMD>Telescope git_commits<CR>", desc = "Checkout commit" },
    { "<Leader>go", "<CMD>Telescope git_status<CR>", desc = "Open changed file" },
    {
      "<Leader>fz",
      function() require("telescope").extensions.z.list({ cmd = { vim.o.shell, "-c", "zoxide query -ls" } }) end,
      desc = "Zoxide",
    },
    { "<Leader>f.", "<CMD>Telescope file_browser<CR>", desc = "Browse files" },
  },

  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope-z.nvim",
    "debugloop/telescope-undo.nvim",
    "Marskey/telescope-sg",

    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
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
        undo = {
          use_delta = false,
        },
        ast_grep = {
          command = {
            "ast-grep",
            "--json=stream",
          },
          grep_open_files = false,
          lang = nil,
        },
      },
    })

    telescope.load_extension("ast_grep")
    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")
    telescope.load_extension("undo")
    telescope.load_extension("z")
    telescope.load_extension("projects")
    telescope.load_extension("scope")

    vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "Title" })
  end,
}
