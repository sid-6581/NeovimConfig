local source = {}

local function is_boolean_option(word)
  local ok, opt = pcall(function() return vim.opt[word]:get() end)
  if ok then return type(opt) == "boolean" end
end

source.new = function()
  local self = setmetatable({}, { __index = source })
  return self
end

function source:get_keyword_pattern() return "." end

function source:get_trigger_characters() return {} end

function source:complete(request, callback)
  local input = request.context.cursor_before_line
  local type = vim.fn.getcmdcompltype()
  local items = vim.fn.getcompletion(input, "cmdline")
  local completions = {}

  for _, item in ipairs(items) do
    table.insert(completions, {
      label = item,
      labelDetails = { description = type },
      insertText = type == "file" and vim.fn.fnameescape(item) or nil,
    })

    if type == "option" and is_boolean_option(item) then
      table.insert(completions, {
        label = "no" .. item,
        labelDetails = { description = type },
      })
    end
  end

  callback({
    items = completions,
    isIncomplete = false,
  })
end

function source:resolve(completion_item, callback) callback(completion_item) end

return source
