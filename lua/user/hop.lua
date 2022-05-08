local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end
hop.setup({
  keys = "etovxqpdygfblzhckisuran"
})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "s", "<cmd>HopChar2<CR>", opts)
keymap("n", "S", "<cmd>HopWord<CR>", opts)
keymap("n", "f", "<cmd>HopChar1CurrentLineAC<CR>", opts)
keymap("n", "F", "<cmd>HopChar1CurrentLineBC<CR>", opts)

