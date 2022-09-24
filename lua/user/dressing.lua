local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
  return
end

dressing.setup({
  input = {
    border = "single",
  },
  select = {
    nui = {
      border = {
        style = "single",
      },
    },
    builtin = {
      border = "single",
    },
  },
})
