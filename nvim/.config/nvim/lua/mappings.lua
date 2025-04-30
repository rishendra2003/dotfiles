require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>ru", function()
  local full_path = vim.fn.expand "%:p"
  local cmd = "sh ~/.config/nvim/custom_runfile.sh " .. full_path
  vim.cmd("!" .. cmd)
end, { desc = "Run C++/Rust File" })
--map("n", "<c-k>", " :wincmd  k<CR>")
--map("n", "<c-j>", " :wincmd  j<CR>")
--map("n", "<c-h>", " :wincmd  h<CR>")
--map("n", "<c-l>", " :wincmd  l<CR>")
map('n', '<C-h>', ':TmuxNavigateLeft<CR>', { noremap = true, silent = true })
map('n', '<C-j>', ':TmuxNavigateDown<CR>', { noremap = true, silent = true })
map('n', '<C-k>', ':TmuxNavigateUp<CR>', { noremap = true, silent = true })
map('n', '<C-l>', ':TmuxNavigateRight<CR>', { noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
