local M = {}

-- Gets filtered buffers.
--- @param filter? BufFilter
--- @return integer[]: Filtered buffer numbers
function M.buffers(filter)
  return vim.tbl_filter(
    function(bufnr) return M.buf_filter(filter or {}, bufnr) end,
    vim.api.nvim_list_bufs()
  )
end

-- Gets filtered windows.
--- @param filter? WinFilter
--- @return integer[]: Filtered window IDs
function M.windows(filter)
  return vim.tbl_filter(
    function(winid) return M.win_filter(filter or {}, winid) end,
    vim.api.nvim_list_wins()
  )
end

-- Checks if a buffer matches a filter.
--- @param filter BufFilter
--- @param bufnr? integer
function M.buf_filter(filter, bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local opts = { buf = bufnr }

  if not vim.api.nvim_buf_is_valid(bufnr) then
    return false
  end

  local bufinfo = vim.fn.getbufinfo(bufnr)[1]

  if filter.normal ~= nil then
    if filter.normal ~= (vim.api.nvim_get_option_value("buftype", opts) == "") then
      return false
    end
  end

  if filter.listed ~= nil then
    if filter.listed ~= (bufinfo.listed == 1) then
      return false
    end
  end

  if filter.hidden ~= nil then
    if filter.hidden ~= (bufinfo.hidden == 1) then
      return false
    end
  end

  if filter.noname ~= nil then
    if filter.noname ~= (
        bufinfo.loaded == 1
        and bufinfo.name == ""
        and bufinfo.listed == 1
        and bufinfo.changed == 0
        and vim.api.nvim_get_option_value("buftype", opts) == ""
        and vim.api.nvim_get_option_value("filetype", opts) == ""
      ) then
      return false
    end
  end

  return true
end

-- Checks if a window matches a filter.
--- @param filter WinFilter
--- @param winid? integer
function M.win_filter(filter, winid)
  winid = winid or vim.api.nvim_get_current_win()

  if not vim.api.nvim_win_is_valid(winid) then
    return false
  end

  local bufnr = vim.api.nvim_win_get_buf(winid)

  if filter.normal ~= nil then
    if filter.normal ~= (vim.api.nvim_win_get_config(winid).relative == "") then
      return false
    end
  end

  if filter.floating ~= nil then
    if filter.floating ~= (vim.api.nvim_win_get_config(winid).relative ~= "") then
      return false
    end
  end

  if filter.tabpage ~= nil then
    local actual_tabpage = filter.tabpage ~= 0 and filter.tabpage or vim.api.nvim_get_current_tabpage()
    if actual_tabpage ~= vim.api.nvim_win_get_tabpage(winid) then
      return false
    end
  end

  if filter.bufnr ~= nil then
    local actual_bufnr = filter.bufnr ~= 0 and filter.bufnr or vim.api.nvim_get_current_buf()
    if actual_bufnr ~= bufnr then
      return false
    end
  end

  if filter.buf ~= nil then
    if not M.buf_filter(filter.buf, bufnr) then
      return false
    end
  end

  return true
end

-- Calls a function on each buffer that matches a filter.
--- @param filter? BufFilter
--- @param func fun(bufnr: integer) Function to run for window
function M.buffers_run(filter, func)
  for _, bufnr in ipairs(M.buffers(filter)) do
    func(bufnr)
  end
end

-- Calls a function on each window that matches a filter.
--- @param filter? WinFilter
--- @param func fun(winid: integer) Function to run for window
function M.windows_run(filter, func)
  for _, winid in ipairs(M.windows(filter)) do
    func(winid)
  end
end

-- Smart buffer closing.
function M.close_window_or_buffer()
  -- If the window doesn't have a normal buffer, we just close it.
  if not M.win_filter({ buf = { normal = true } }) then
    vim.cmd.quit()
    return
  end

  local windows_with_buffer = M.windows({ bufnr = 0 })

  -- If the buffer is open in any other window (even on other tab pages), we close the window.
  -- If we're closing the only window containing this buffer, we delete the buffer to remove
  -- it from the listed buffers. The window will be closed automatically.
  if #windows_with_buffer > 1 then
    vim.cmd.quit()
  else
    -- If there's only one window on this tab page we have to be careful, we can't just delete
    -- the buffer, because that can also close the tab page.
    if #M.windows({ tabpage = 0 }) == 1 then
      require("mini.bufremove").delete()
    else
      vim.cmd.bdelete()
    end
  end

  -- If we are now left with a tab page with a single window containing a no name buffer, we close it.
  if #M.windows({ normal = true, tabpage = 0 }) == 1 and M.buf_filter({ noname = true }) then
    vim.cmd.quit()
  end
end

return M

--- @class BufFilter
--- @field normal? boolean
--- @field listed? boolean
--- @field hidden? boolean
--- @field noname? boolean

--- @class WinFilter
--- @field normal? boolean
--- @field floating? boolean
--- @field tabpage? integer
--- @field bufnr? integer
--- @field buf? BufFilter
