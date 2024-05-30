return {
  "j-hui/fidget.nvim",
  priority = 999, -- High priority because it hijacks notifications

  opts = {
    progress = {
      ignore_done_already = false,
      ignore_empty_message = false,
      display = {
        overrides = {
          lua_ls = {
            update_hook = function(item)
              require("fidget.notification").set_content_key(item)
              if item.annote:match("Searching") then item.hidden = true end
            end,
          },
          rust_analyzer = {
            update_hook = function(item)
              require("fidget.notification").set_content_key(item)
              if item.annote:match("clippy") then item.hidden = true end
              if item.annote:match("Roots") then item.hidden = true end
              if item.annote:match("Loading") then item.hidden = true end
            end,
          },
        },
      },
    },
    notification = {
      filter = vim.log.levels.DEBUG,
      override_vim_notify = true,
      view = {
        stack_upwards = false,
      },
      window = {
        winblend = 0,
        x_padding = 0,
        y_padding = 0,
      },
      configs = {
        default = {
          update_hook = function(item)
            require("fidget.notification").set_content_key(item)
            -- Hide deprecation related messages.
            if item.message:match("tbl_islist") then item.hidden = true end
            if item.message:match("tbl_add_reverse_lookup") then item.hidden = true end
            if item.message:match("diagnostic.is_disabled") then item.hidden = true end
            if item.message:match("buf_get_clients") then item.hidden = true end
            if item.message:match("requires a list") then item.hidden = true end
          end,
        },
      },
    },
  },
}
