local colors = require("colors").get()

local fg = require("core.utils").fg
local fg_bg = require("core.utils").fg_bg
local bg = require("core.utils").bg

-- FIX: Did not work for me
-- fg("Comment", #6272a4 .. " gui=italic")

-- TODO: Should add a check for Dracula before setting these 
-- Change Comment Color for Dracula
vim.cmd("hi Comment guifg=#A2B2E4 gui=italic") 
-- Keywords are italicized
vim.cmd("hi Keyword guifg=#ff79c6 gui=italic,bold") 
-- HACK: to fix folke/todo-comments.nvim gutter sign backgrounds
vim.cmd("hi TodoSignNOTE guibg=#282a36")
vim.cmd("hi TodoSignTODO guibg=#282a36")
vim.cmd("hi TodoSignFIX guibg=#282a36")
vim.cmd("hi TodoSignHACK guibg=#282a36")
vim.cmd("hi TodoSignPERF guibg=#282a36")
vim.cmd("hi TodoSignWARN guibg=#282a36")
vim.cmd("hi TodoSignIDEA guibg=#282a36")
-- NOTE: Make Labeled Comments Really Stand out
vim.cmd("hi TodoFgNOTE gui=bold,italic")
vim.cmd("hi TodoFgTODO gui=bold,italic")
vim.cmd("hi TodoFgFIX gui=bold,italic")
vim.cmd("hi TodoFgHACK gui=bold,italic")
vim.cmd("hi TodoFgIDEA gui=bold,italic")
vim.cmd("hi TodoFgPERF gui=bold,italic")
vim.cmd("hi TodoFgWARN gui=bold,italic")
-- Telescope Border
vim.cmd("hi TelescopePromptBorder guifg=#bda3f9")
vim.cmd("hi TelescopeResultsBorder guifg=#ff5555")
vim.cmd("hi TelescopePreviewBorder guifg=#50fa7b")
-- Folded Line Color
vim.cmd("hi Folded guibg=#1B1D29")
-- Dashboard
vim.cmd("hi DashboardCenter guifg=#bd93f9")
vim.cmd("hi DashboardShortcut guifg=#ffb86c")
vim.cmd("hi DashboardHeader guifg=#50fa7b")

