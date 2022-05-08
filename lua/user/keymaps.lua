local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", "<Cmd>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<Cmd>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<Cmd>bnext<CR>", opts)
keymap("n", "<S-h>", "<Cmd>bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc><Cmd>m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc><Cmd>m .-2<CR>==", opts)

keymap("n", ",.", "<C-U>", opts)                                                -- Scroll upwards
keymap("n", ",/", "<C-D>", opts)                                                -- Scroll downwards
keymap("n", ",vb", "<C-V>", opts)                                               -- Visual block mode
keymap("n", ",r", "<C-R>", opts)                                                -- Redo last change
keymap("n", ",lD", "[<C-D>", opts)                                              -- Jump to first macro definition of word
keymap("n", ",ld", "]<C-D>", opts)                                              -- Jump to next macro definition of word
keymap("n", ",lI", "[<C-I>", opts)                                              -- Jump to first line containing word
keymap("n", ",li", "]<C-I>", opts)                                              -- Jump to next line containing word
keymap("n", ",wa", "<C-^>", opts)                                               -- Edit alternate buffer in current window
keymap("n", ",wn", "<C-W><C-W>", opts)                                          -- Next window
keymap("n", ",wp", "<C-W>W", opts)                                              -- Previous window
keymap("n", ",wh", "<C-W>h", opts)                                              -- Left one window
keymap("n", ",wl", "<C-W>l", opts)                                              -- Right one window
keymap("n", ",wj", "<C-W>j", opts)                                              -- Up one window
keymap("n", ",wk", "<C-W>k", opts)                                              -- Down one window
keymap("n", ",wH", "<C-W>H", opts)                                              -- Move current window to left
keymap("n", ",wL", "<C-W>L", opts)                                              -- Move current window to right
keymap("n", ",wJ", "<C-W>J", opts)                                              -- Move current window to bottom
keymap("n", ",wK", "<C-W>K", opts)                                              -- Move current window to top
keymap("n", ",wx", "<C-W>x", opts)                                              -- Exchange current window with next
keymap("n", ",wr", "<C-W>r", opts)                                              -- Rotate windows downwards/rightwards
keymap("n", ",wR", "<C-W>R", opts)                                              -- Rotate windows upwards/leftwards
keymap("n", ",w_", "<C-W>_", opts)                                              -- Maximize window height
keymap("n", ",w,", "<C-W>-", opts)                                              -- Decrease window height
keymap("n", ",w.", "<C-W>+", opts)                                              -- Increase window height
keymap("n", ",w<bar>", "<C-W><bar>", opts)                                      -- Maximize window width
keymap("n", ",w<", "<C-W><", opts)                                              -- Decrease window width
keymap("n", ",w>", "<C-W>>", opts)                                              -- Increase window width
keymap("n", ",w=", "<C-W>=", opts)                                              -- Make windows equally high and wide
keymap("n", ",wo", "<C-W>o", opts)                                              -- Make current window the only one
keymap("n", ",wc", "<C-W>c", opts)                                              -- Close current window
keymap("n", ",[", "<C-T>", opts)                                                -- Pop tag from stack
keymap("n", ",]", "<C-]>", opts)                                                -- Jump to tag
keymap("n", "<bs>", "<Cmd>noh<return>", opts)                                   -- Clear highlighting after a search.
keymap("n", "Y", "y$", opts)                                                    -- Yank to the end of the line instead of whole line
keymap("n", ",o", "<Cmd>exe \"normal O\"<CR>", opts)                            -- Insert an empty line above current line.
keymap("n", "`", "<Cmd>exe \"normal i\" . nr2char(getchar())<CR>", opts)        -- Insert one character and escape from insert mode.

-- Insert --

-- keymap("i", "<Esc>", "<C-O><Cmd>stopinsert<CR>", opts)                          -- Make escaping from insert mode not move the cursor to the left.
-- keymap("i", "jk", "<Esc>", term_opts)                                           -- Press jk fast to enter

-- Visual --

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Yank lines (il and al)
keymap("v", "al", "<Cmd><c-u>norm!0v$<CR>", opts)
keymap("v", "il", "<Cmd><c-u>norm!^vg_<CR>", opts)

-- Move text up and down
keymap("v", "<A-j>", "<Cmd>m .+1<CR>==", opts)
keymap("v", "<A-k>", "<Cmd>m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --

-- Move text up and down
keymap("x", "J", "<Cmd>move '>+1<CR>gv-gv", opts)
keymap("x", "K", "<Cmd>move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", "<Cmd>move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", "<Cmd>move '<-2<CR>gv-gv", opts)

-- Terminal --

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Operator Pending --

-- Yank lines (il and al)
keymap("o", "al", "<Cmd>norm val<CR>", opts)
keymap("o", "il", "<Cmd>norm vil<CR>", opts)


