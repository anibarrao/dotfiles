local opts = { noremap = true, silent = true, expr = false}
local term_opts = { silent = true }
local vimmap = vim.api.nvim_set_keymap

local map = function(mode, keymap, exec) 
  vimmap(mode, keymap, exec, opts)
end

local tmap = function(keymap, exec) 
  vimmap("t", keymap, exec, term_opts)
end

-- Space as leader key
map("", '<Space>', "<Nop>", opts)
vim.g.mapleader = " "

-- Abbreviations
--vim.cmd("cnoreabbrev W w")
--vim.cmd("cnoreabbrev Q q")

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


---- Normal keybindings
-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Open explorer
map("n", "<leader>e", ":Lex 30<CR>")

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bnext<CR>")

-- Move text up and down
map("n", "<A-j>", ":m .+1<CR>")
map("n", "<A-k>", ":m .-2<CR>")

-- Open mappings and plugins faster, reload configs
map("n", "\\m", ":vsplit ~/.config/nvim/lua/general/mappings.lua<CR>")
map("n", "\\p", ":vsplit ~/.config/nvim/lua/plugins.lua<CR>")
map("n", "\\r", ":source %<CR>")

-- use ESC to exit search highlight
map("n", "<Esc>", ":noh<CR>")

--save and quit faster
map("n", "<S-q>", ":q<CR>")
map("n", "<S-w>", ":w<CR>")
map("n", "<S-x>", ":wq<CR>")


---- Insert mode
map("i", "jj", "<Esc>")
map("i", "kk", "<Esc>")
map("i", "jk", "<Esc>")
map("i", "hh", "<Esc>")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Terminal --
-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h")
map("t", "<C-j>", "<C-\\><C-N><C-w>j")
map("t", "<C-k>", "<C-\\><C-N><C-w>k")
map("t", "<C-l>", "<C-\\><C-N><C-w>l")
