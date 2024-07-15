return {
    -- 'sainnhe/sonokai',
    -- 'jacoborus/tender.vim',
    --
    'AlexvZyl/nordic.nvim',

    lazy = false,
    priority = 1000,
    config = function()
        --vim.g.sonokai_enable_italic = true
        require('nordic').setup({
            transparent_bg = true,
            cursorline = {
                theme = 'light'
            }
        })

        vim.cmd.colorscheme('nordic')
        vim.cmd [[g:lightline = { 'colorscheme': 'nordic' }]]
        -- vim.api.nvim_set_hl(0, 'Normal', {bg = 'none'})
        -- vim.api.nvim_set_hl(0, 'NormalFloat', {bg = 'none'})
    end
}

