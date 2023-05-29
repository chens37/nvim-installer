
vim.g.mapleader = ","
vim.g.mapleader = ","

local GTAGSLABEL = 'native-pygments'
local GTAGSCONF = '~/.local/share/gtags/gtags.conf'

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

map("n", "<leader>q","<C-w>q", opt)
-- move
map("n", "<C-j>","8j", opt)
map("n", "<C-k>","8k", opt)
map("n", "<C-h>","8h", opt)
map("n", "<C-l>","8l", opt)

-- telescope
map("n", "<leader>f", ":Telescope find_files<CR>", opt)
map("n", "<leader>g", ":Telescope live_grep<CR>", opt)
map("n", "<leader>b", ":Telescope buffers<CR>", opt)
map("n", "<leader>s", ":Telescope grep_string<CR>", opt)

-- nvim-tree
map("n", "<F4>", ":NvimTreeToggle<CR>", opt)

local opt2 = {noremap = true, silent =false}
map("n", "<F3>", ":set noexpandtab<CR>", opt2)
map("n", "<F2>", ":set expandtab<CR>", opt2)
-- lsp
local pluginKeys = {}

pluginKeys.maptag = function()
    map("n", "<leader>d", ":GscopeFind g <C-R><C-W><cr>", opt)
    map("n", "<leader>c", ":GscopeFind c <C-R><C-W><cr>", opt)
    map("n", "<leader>i", ":GscopeFind i <C-R><C-W><cr>", opt)
    --map("n", "q", ":cclose", opt)
end
function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      --vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<leader>q', [[<Cmd>wincmd l<CR>]], opts)
  end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')


-- lsp 回调函数快捷键设置
pluginKeys.maplsp = function(mapbuf)
    -- rename
    mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
    -- code action
    mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
    -- go xx
    mapbuf('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
    mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
    mapbuf('n', '<leader>D', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
    mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
    mapbuf('n', '<leader>c', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
    -- diagnostic
    mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
    mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
    mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- leader + =
    mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
    -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  return {
    -- 上一个
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    -- 下一个
    ['<C-j>'] = cmp.mapping.select_next_item(),
    -- 出现补全
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- 取消
    ['<C-e>'] = cmp.mapping.abort(),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({
      select = true ,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  }
end

return pluginKeys

