-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.backup = false -- creates a backup file
opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.scrolloff = 8 -- Lines of context
opt.swapfile = false -- creates a swapfile
opt.whichwrap:append "<,>,[,],h,l" -- keys allowed to move to the previous/next line when the beginning/end of line is reached
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
