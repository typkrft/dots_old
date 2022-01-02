-- vim.api.nvim_exec([[ autocmd BufEnter * if &filetype == "dashboard" | set showtabline=0 | endif ]], false)
vim.cmd [[
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
]]

vim.api.nvim_exec([[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=250 }
augroup END
]], false)

