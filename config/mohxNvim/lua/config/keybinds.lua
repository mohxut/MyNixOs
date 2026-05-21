vim.g.mapleader = " "
local key = vim.keymap.set
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
key("i","jk","<c-c>")
key("t","<ESC><ESC>","<c-\\><c-n>")
key("n","<Tab>","<cmd>bnext!<CR>")
key("n","<S-Tab>","<cmd>bprev!<CR>")
key("n","<space><space>x","<cmd>source %<CR>")
key("n","<space>x","<cmd>:.lua<CR>")




