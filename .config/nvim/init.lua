local keymap = vim.api.nvim_set_keymap
local g = vim.g
local opt = vim.opt

opt.termguicolors = true
g.mapleader = " "
g.maplocalleader = " "

-- fix for some weird bugs in windows when trying to use commands while running neovim in git bash
opt.shellcmdflag = "-c"
opt.shellxquote = ""

----------------------------------------------------
--                      Lazy                      --
----------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
----------------------------------------------------
----------------------------------------------------

vim.cmd("colorscheme moonfly")

----------------------------------------------------
--                      LSP                       --
----------------------------------------------------
--vim.lsp.set_log_level("off")

-- enabling
vim.lsp.enable("clangd")
vim.lsp.enable("cssls")
vim.lsp.enable("html")
vim.lsp.enable("tsserver")
----------------------------------------------------
----------------------------------------------------

----------------------------------------------------
--                    Settings                    --
----------------------------------------------------
-- Splitting
opt.splitbelow = true
opt.splitright = true

-- Searching/Line numbering
opt.ignorecase = true
opt.smartcase = true
opt.number = true
opt.relativenumber = true

-- Tab/Indentation related
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

if vim.g.neovide then -- for Neovide
	vim.g.neovide_cursor_animation_length = 0 -- disable cursor anim
	vim.o.guifont = "Iosevka Nerd Font Mono:h12"
end
----------------------------------------------------
----------------------------------------------------


----------------------------------------------------
--                    Keymaps                     --
----------------------------------------------------
require("myfunctions/moveorsplit")

local shh_nore = {noremap = true, silent = true}

-- Moving around splits and splitting with the same key
keymap("n", "<c-h>", ":lua moveOrSplit('h')<CR>", shh_nore)
keymap("n", "<c-j>", ":lua moveOrSplit('j')<CR>", shh_nore)
keymap("n", "<c-k>", ":lua moveOrSplit('k')<CR>", shh_nore)
keymap("n", "<c-l>", ":lua moveOrSplit('l')<CR>", shh_nore)

-- Remove search highlighting with esc
keymap("n", "<ESC>", ":noh<CR>", shh_nore)

-- LSP Pretty Hover
keymap("n", "K", ":lua require('pretty_hover').hover()<CR>", shh_nore)
----------------------------------------------------
----------------------------------------------------
