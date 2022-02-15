if vim.api.nvim_eval("exists('g:vscode')") then
    require('vscode')
else 
    require('keybindings')
end


