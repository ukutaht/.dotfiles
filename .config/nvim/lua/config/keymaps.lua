local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("i", "jk", "<ESC>", opts)

keymap("n", "<leader>nh", ":nohl<CR>", opts)

keymap("n", "x", '"_x', opts)

keymap("n", "<leader>+", "<C-a>", opts)
keymap("n", "<leader>-", "<C-x>", opts)

keymap("n", "<leader>sv", "<C-w>v", opts)
keymap("n", "<leader>sh", "<C-w>s", opts)
keymap("n", "<leader>se", "<C-w>=", opts)
keymap("n", "<leader>sx", ":close<CR>", opts)

keymap("n", "<leader>to", ":tabnew<CR>", opts)
keymap("n", "<leader>tx", ":tabclose<CR>", opts)
keymap("n", "<leader>tn", ":tabn<CR>", opts)
keymap("n", "<leader>tp", ":tabp<CR>", opts)

keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap("n", "J", "mzJ`z", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

keymap("x", "<leader>p", [["_dP]], opts)

keymap({ "n", "v" }, "<leader>y", [["+y]], opts)
keymap("n", "<leader>Y", [["+Y]], opts)

keymap({ "n", "v" }, "<leader>d", [["_d]], opts)

keymap("n", "Q", "<nop>", opts)

keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", opts)

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

keymap("n", "<leader>w", "<cmd>w<CR>", opts)
keymap("n", "<leader>q", "<cmd>q<CR>", opts)
keymap("n", "<leader>wq", "<cmd>wq<CR>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<Up>", "<cmd>resize +2<CR>", opts)
keymap("n", "<Down>", "<cmd>resize -2<CR>", opts)
keymap("n", "<Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<Right>", "<cmd>vertical resize +2<CR>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)