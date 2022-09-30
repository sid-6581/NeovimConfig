local M = {}

M.safe_require = function(module_name)
  local status, module = pcall(require, module_name)
  if not status then return nil end
  return module
end

return M
