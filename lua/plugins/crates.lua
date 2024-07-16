return {
  "Saecki/crates.nvim",
  event = "VeryLazy",

  opts = {
    lsp = {
      enabled = true,
      actions = true,
      completion = true,
      hover = true,
      on_attach = function(_client, bufnr)
        require("which-key").add({
          "K",
          function()
            if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
              require("crates").show_popup()
            else
              vim.lsp.buf.hover()
            end
          end,
          buffer = bufnr,
          desc = "Show information [crates]"
        })
      end,
    },
    popup = {
      border = "single",
    },
  },
}
