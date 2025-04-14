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

  if filter.filetype ~= nil then
    if filter.filetype ~= vim.api.nvim_get_option_value("filetype", opts) then
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

  if filter.normal ~= nil then
    if filter.normal ~= (vim.api.nvim_win_get_config(winid).relative == "") then
      return false
    end
  end

  if filter.tabpage ~= nil then
    local actual_tabpage = filter.tabpage ~= 0 and filter.tabpage or vim.api.nvim_get_current_tabpage()
    if actual_tabpage ~= vim.api.nvim_win_get_tabpage(winid) then
      return false
    end
  end

  local win_bufnr = vim.api.nvim_win_get_buf(winid)

  if filter.bufnr ~= nil then
    local bufnr = filter.bufnr ~= 0 and filter.bufnr or vim.api.nvim_get_current_buf()
    if bufnr ~= win_bufnr then
      return false
    end
  end

  if filter.buf ~= nil then
    if not M.buf_filter(filter.buf, win_bufnr) then
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
  local function notify(_msg)
    -- vim.notify(msg)
  end

  local is_normal_buffer = M.buf_filter({ normal = true })
  local is_normal_window = M.win_filter({ normal = true })
  local normal_window_count = #M.windows({ tabpage = 0, normal = true })
  local normal_buffer_window_count = #M.windows({ tabpage = 0, normal = true, buf = { normal = true } })

  if not is_normal_buffer or not is_normal_window then
    notify("Closing non-normal window")
    if normal_window_count > 1 then
      -- If this isn't a normal buffer or a normal window, we just close the window.
      -- This should cover all splits with non-normal buffers, as well as floats with or without a normal buffer.
      vim.cmd.quit()
    else
      -- This is needed if a non-normal buffer is the only window.
      vim.cmd.bdelete()
    end

    return
  end

  -- If this buffer is open in any other window (even on other tab pages), we can't delete the buffer.
  -- We can close the window if there are multiple windows with normal buffers.
  -- Otherwise, we have to create a new no name buffer in its place, and unlist the old buffer.
  if #M.windows({ bufnr = 0 }) > 1 then
    if normal_buffer_window_count > 1 then
      notify("Closing duplicate window")
      vim.cmd.quit()
    else
      notify("Creating no name buffer in place of duplicate")
      local bufnr = vim.api.nvim_get_current_buf()
      vim.cmd.enew()
      vim.api.nvim_set_option_value("buflisted", false, { buf = bufnr })
    end

    return
  end

  -- If we have only one normal buffer window but multiple listed buffers, we need to ensure that the window
  -- doesn't close when we delete the buffer. We switch to the previous buffer and then delete the old buffer,
  -- which is now the alternate buffer.
  if normal_buffer_window_count == 1 and #M.buffers({ listed = true }) > 1 then
    notify("Switching to previous buffer and deleting alternate")
    vim.cmd.bprevious()
    vim.cmd.bdelete("#")
    return
  end

  -- If there is only one normal window on this tab page, deleting the buffer will just put a no name buffer in
  -- the window, so we need to close the window after deleting the buffer.
  if normal_window_count == 1 then
    notify("Deleting buffer and closing window")
    vim.cmd.bdelete()
    vim.cmd.quit()
    return
  end

  notify("Deleting buffer")
  vim.cmd.bdelete()
end

function M.colorize()
  vim.wo.number = false
  vim.wo.relativenumber = false
  vim.wo.statuscolumn = ""
  vim.wo.signcolumn = "no"
  vim.opt.listchars = { space = " " }

  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

  while #lines > 0 and vim.trim(lines[#lines]) == "" do
    lines[#lines] = nil
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
  vim.api.nvim_chan_send(vim.api.nvim_open_term(buf, {}), table.concat(lines, "\r\n"))
  vim.keymap.set("n", "q", "<cmd>q<cr>", { silent = true, buffer = buf })
  vim.api.nvim_create_autocmd("TermEnter", { buffer = buf, command = "stopinsert" })
end

return M

--- @class BufFilter
--- @field normal? boolean
--- @field listed? boolean
--- @field hidden? boolean
--- @field noname? boolean
--- @field filetype? string

--- @class WinFilter
--- @field normal? boolean true for non-floating windows, false for floating windows
--- @field tabpage? integer
--- @field bufnr? integer
--- @field buf? BufFilter
