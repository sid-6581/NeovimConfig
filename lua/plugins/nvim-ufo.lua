local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (" 󰁂 %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0

  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)

    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)

      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end

      break
    end

    curWidth = curWidth + chunkWidth
  end

  table.insert(newVirtText, { suffix, "MoreMsg" })

  return newVirtText
end

return {
  "kevinhwang91/nvim-ufo",
  event = "VeryLazy",

  dependencies = {
    "kevinhwang91/promise-async",
  },

  keys = {
    { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds [ufo]" },
    { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds [ufo]" },
    { "zr", function() require("ufo").openFoldsExceptKinds() end, desc = "Open folds except specified kinds [ufo]" },
    { "zm", function() require("ufo").closeFoldsWith() end, desc = "Close folds with a higher level [ufo]" },
    { "]z", function() require("ufo").goNextClosedFold() end, desc = "Go to next closed fold [ufo]" },
    { "[z", function() require("ufo").goPreviousClosedFold() end, desc = "Go to previous closed fold [ufo]" },
  },

  opts = {
    fold_virt_text_handler = handler,
    provider_selector = function(_bufnr, _filetype, _buftype) return { "treesitter", "indent" } end,
  },
}
