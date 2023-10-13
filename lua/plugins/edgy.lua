return {
  "folke/edgy.nvim",
  event = "VeryLazy",

  opts = {
    animate = {
      enabled = false,
    },
    bottom = {
      {
        ft = "toggleterm",
        size = { height = 0.4 },
        filter = function(_buf, win) return vim.api.nvim_win_get_config(win).relative == "" end,
      },
      "Trouble",
      { ft = "qf", title = "QuickFix" },
      {
        ft = "help",
        size = { height = 20 },
        filter = function(buf) return vim.bo[buf].buftype == "help" end,
      },
      { ft = "spectre_panel", size = { height = 0.4 } },
    },
    left = {
      {
        title = "Neo-Tree",
        ft = "neo-tree",
        filter = function(buf) return vim.b[buf].neo_tree_source == "filesystem" end,
        open = "Neotree reveal_force_cwd",
        size = { height = 0.5 },
      },
      {
        title = "Neo-Tree Git",
        ft = "neo-tree",
        filter = function(buf) return vim.b[buf].neo_tree_source == "git_status" end,
        pinned = true,
        open = "Neotree position=right git_status",
      },
      {
        title = "Neo-Tree Buffers",
        ft = "neo-tree",
        filter = function(buf) return vim.b[buf].neo_tree_source == "buffers" end,
        pinned = true,
        open = "Neotree position=top buffers",
      },
      {
        ft = "aerial",
        pinned = true,
        open = "AerialOpen",
      },
    },
  },
}
