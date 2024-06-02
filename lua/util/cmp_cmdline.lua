local source = {}

source.new = function()
  local self = setmetatable({}, { __index = source })
  return self
end

source.get_trigger_characters = function() return { ".", " ", "~", "/", "\\" } end

source.complete = function(_self, request, callback)
  local input = request.context.cursor_before_line
  local type = vim.fn.getcmdcompltype()
  local items = vim.fn.getcompletion(input, "cmdline")
  local completions = {}

  for _, item in ipairs(items) do
    table.insert(completions, {
      label = item,
      labelDetails = { description = type },
    })
  end

  callback({
    items = completions,
    isIncomplete = false,
  })
end

return source
