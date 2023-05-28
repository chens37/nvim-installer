  --'ludovicchabant/vim-gutentags'
  --config = function()
    -- https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/
    
    vim.g.gutentags_add_default_project_roots = false
    vim.g.gutentags_project_root = { 'package.json', '.git' , '.root' }
    --vim.g.gutentags_root = { 'package.json', '.git' , '.root' }
    --vim.g.gutentags_cache_dir = vim.fn.stdpath("data") .. '/ctags'
    vim.g.gutentags_generate_on_new = true
    vim.g.gutentags_generate_on_missing = true
    vim.g.gutentags_generate_on_write = true
    vim.g.gutentags_generate_on_empty_buffer = 1 
    vim.g.gutentags_modules = true
    vim.cmd([[let g:gutentags_cache_dir = expand('~/.cache/tags')]])
    vim.g.gutentags_define_advanced_commands = 1
    --vim.g.gutentags_ctags_extra_args = { '--tag-relative=yes', '--fields=+ailmnS', }
    vim.g.gutentags_plus_switch = 1
    vim.g.gutentags_plus_nomap = 1

    -- custom
    vim.g.gutentags_modules = { 'gtags_cscope' }

    require('keybindings').maptag()
  --end
