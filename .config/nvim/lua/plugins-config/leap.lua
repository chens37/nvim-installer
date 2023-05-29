-- Bidirectional search in the current window is just a specific case of the
-- multi-window mode.
--require('leap').leap { target_windows = { vim.fn.win_getid() } }

vim.keymap.set('n', 's', function ()
    local focusable_windows_on_tabpage = vim.tbl_filter(
    function (win) return vim.api.nvim_win_get_config(win).focusable end,
    vim.api.nvim_tabpage_list_wins(0)
    )
    require('leap').leap { target_windows = focusable_windows_on_tabpage }
end)
-- Searching in all windows (including the current one) on the tab page.
--require('leap').leap { target_windows = vim.tbl_filter(
--  function (win) return vim.api.nvim_win_get_config(win).focusable end,
--  vim.api.nvim_tabpage_list_wins(0)
--)}
--return require('leap').add_default_mappings()
