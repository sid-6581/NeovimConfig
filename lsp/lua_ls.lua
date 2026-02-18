return {
  settings = {
    Lua = {
      codeLens = {
        enable = false,
      },
      completion = {
        workspaceWord = false,
        postfix = ".",
        keywordSnippet = "Disable",
      },
      diagnostics = {
        unusedLocalExclude = { "_*" },
        globals = { "vim", "require" },
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          continuation_indent_size = "2",
        },
      },
      telemetry = {
        enable = false,
      },
      workspace = {
        preloadFileSize = 2000,
      },
    },
  },
}
