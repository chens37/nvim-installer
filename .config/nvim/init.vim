
lua require('basic')
lua require('plugins')
lua require('keybindings')

" 插件配置
lua require('plugins-config/alpha')
lua require('plugins-config/nvim-tree')
lua require('plugins-config/gutentags')
lua require('plugins-config/telescope')
lua require('plugins-config/toggleterm')
lua require('plugins-config/treesitter')
lua require('plugins-config/leap')
lua require('plugins-config/cmp')

" lsp
"lua require('lsp/setup')

" 补全
"lua require('lsp/nvim-cmp')
set clipboard+=unnamedplus
" term
