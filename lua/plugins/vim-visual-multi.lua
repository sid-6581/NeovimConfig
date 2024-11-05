---@format disable-next
local mappings = {
  { "<Esc>",            name = "Exit",                 desc = "Exit",                                                                 },
  { "<C-n>",            name = "Find Under",           desc = "Select word under cursor",                    perm = true,             },
  { "<C-n>",            name = "Find Subword Under",   desc = "Select word under cursor",                    perm = true, mode = "v", },
  { "<C-Down>",         name = "Add Cursor Down",      desc = "Create cursors vertically",                   perm = true,             },
  { "<C-Up>",           name = "Add Cursor Up",        desc = "Create cursors vertically",                   perm = true,             },
  { "\\\\A",            name = "Select All",           desc = "Select all occurrences of a word",            perm = true,             },
  { "\\\\/",            name = "Start Regex Search",   desc = "Create a selection with regex search",        perm = true,             },
  { "\\\\\\",           name = "Add Cursor At Pos",    desc = "Add a single cursor at current position",     perm = true,             },
  { "\\\\gS",           name = "Reselect Last",        desc = "Reselect set of regions of last session",     perm = true,             },
  -- { "<C-LeftMouse>",    name = "Mouse Cursor",         desc = "Create a cursor where clicked",               perm = true,             },
  -- { "<C-RightMouse>",   name = "Mouse Word",           desc = "Select a word where clicked",                 perm = true,             },
  -- { "<M-C-RightMouse>", name = "Mouse Column",         desc = "Create a column from cursor",                 perm = true,             },

  { "\\\\A",            name = "Visual All",           desc = "Select all occurrences of visual selection",  perm = true, mode = "x", },
  { "\\\\/",            name = "Visual Regex",         desc = "Find a pattern in visual selection",          perm = true, mode = "x", },
  { "\\\\f",            name = "Visual Find",          desc = "Find all patterns (or @/) from visual mode",  perm = true, mode = "x", },
  { "\\\\c",            name = "Visual Cursors",       desc = "Create a column of cursors from visual mode", perm = true, mode = "x", },
  { "\\\\a",            name = "Visual Add",           desc = "Create a region from visual mode",            perm = true, mode = "x", },
  { "\\\\s",            name = "Visual Subtract",      desc = "Remove regions in current visual selection",  perm = true, mode = "x", },
  { "\\\\r",            name = "Visual Reduce",        desc = "Remove regions outside of visual selection",  perm = true, mode = "x", },

  { "n",                name = "Find Next",            desc = "Find next occurrence",                        },
  { "N",                name = "Find Prev",            desc = "Find previous occurrence",                    },
  { "]",                name = "Goto Next",            desc = "Go to next selected region",                  },
  { "[",                name = "Goto Prev",            desc = "Go to previous selected region",              },
  { "<C-f>",            name = "Seek Next",            desc = "Fast go to next (from next page)",            },
  { "<C-b>",            name = "Seek Prev",            desc = "Fast go to previous (from previous page)",    },
  { "q",                name = "Skip Region",          desc = "Skip and find to next",                       },
  { "Q",                name = "Remove Region",        desc = "Remove region under cursor",                  },
  { "g/",               name = "Slash Search",         desc = "Extend/move cursors with /",                  },
  { "R",                name = "Replace",              desc = "Replace in regions, or start replace mode",   },
  { "M",                name = "Toggle Multiline",     desc = "Toggle multiline",                            },
  { "S",                name = "Surround",             desc = "Surround",                                    },
  { "<M-S-Right>",      name = "Move Right",           desc = "Move all selections to the right",            },
  { "<M-S-Left>",       name = "Move Left",            desc = "Move all selections to the left",             },
  { "<Tab>",            name = "I Next",               desc = "Move to next cursor",                         },
  { "<S-Tab>",          name = "I Prev",               desc = "Move to previous cursor",                     },
  { "s",                name = "Select Operator",      desc = "Select operator",                             },
  { "m",                name = "Find Operator",        desc = "Find operator",                               },
  { "<C-A>",            name = "Increase",             desc = "Increase numbers",                            },
  { "<C-X>",            name = "Decrease",             desc = "Decrease numbers",                            },
  { "g<C-A>",           name = "gIncrease",            desc = "Progressively increase numbers",              },
  { "g<C-X>",           name = "gDecrease",            desc = "Progressively decrease numbers",              },
  { "\\\\<C-A>",        name = "Alpha-Increase",       desc = "Progressively increase alpha numbers",        },
  { "\\\\<C-X>",        name = "Alpha-Decrease",       desc = "Progressively decrease alpha numbers",        },
  { "\\\\t",            name = "Transpose",            desc = "Transpose",                                   },
  { "\\\\a",            name = "Align",                desc = "Align regions",                               },
  { "\\\\<",            name = "Align Char",           desc = "Align by character",                          },
  { "\\\\>",            name = "Align Regex",          desc = "Align by regex",                              },
  { "\\\\s",            name = "Split Regions",        desc = "Subtract pattern from regions",               },
  { "\\\\f",            name = "Filter Regions",       desc = "Filter regions by pattern/expression",        },
  { "\\\\e",            name = "Transform Regions",    desc = "Transform regions with expression",           },
  { "\\\\r",            name = "Rewrite Last Search",  desc = "Rewrite last pattern to match current region",},
  { "\\\\m",            name = "Merge Regions",        desc = "Merge overlapping regions",                   },
  { "\\\\d",            name = "Duplicate",            desc = "Duplicate regions",                           },
  { "\\\\-",            name = "Shrink",               desc = "Reduce regions from the sides",               },
  { "\\\\+",            name = "Enlarge",              desc = "Enlarge regions from the sides",              },
  { "\\\\L",            name = "One Per Line",         desc = "Keep at most one region per line",            },
  { "\\\\n",            name = "Numbers",              desc = "Prepend numbers",                             },
  { "\\\\N",            name = "Numbers Append",       desc = "Append numbers",                              },
  { "\\\\z",            name = "Run Normal",           desc = "Run normal",                                  },
  { "\\\\v",            name = "Run Visual",           desc = "Run visual",                                  },
  { "\\\\x",            name = "Run Ex",               desc = "Run ex",                                      },
  { "\\\\Z",            name = "Run Last Normal",      desc = "Run last normal",                             },
  { "\\\\V",            name = "Run Last Visual",      desc = "Run last visual",                             },
  { "\\\\X",            name = "Run Last Ex",          desc = "Run last ex",                                 },
  { "\\\\@",            name = "Run Macro",            desc = "Run macro",                                   },
  { "\\\\`",            name = "Tools Menu",           desc = "Filter lines to buffer, etc",                 },
  { "\\\\C",            name = "Case Conversion Menu", desc = "Works better in extend mode",                 },
  { "\\\\\"",           name = "Show Registers",       desc = "Show registers in the command line",          },
  { "\\\\w",            name = "Toggle Whole Word",    desc = "Toggle whole word search",                    },
  { "\\\\c",            name = "Case Setting",         desc = "Cycle case setting",                          },
  { "\\\\<Space>",      name = "Toggle Mappings",      desc = "Toggle mappings",                             },
  { "\\\\<CR>",         name = "Toggle Single Region", desc = "Toggle single region mode",                   },
}

return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",

  init = function()
    local maps = {}
    local force_maps = {}

    -- Do all this to fix conflicts with which-key
    for _, m in ipairs(mappings) do
      maps[m.name] = m[1]
      force_maps[#force_maps + 1] = m[1]
    end

    force_maps[#force_maps + 1] = ","

    vim.g.VM_set_statusline = 0
    vim.g.VM_show_warnings = 1
    vim.g.VM_silent_exit = 1
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = maps
    vim.g.VM_force_maps = force_maps
  end,
}
