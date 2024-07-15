return {
    -- 'sainnhe/sonokai',
    -- 'jacoborus/tender.vim',
    --
    'AlexvZyl/nordic.nvim',

    lazy = false,
    priority = 1000,
    config = function()
<<<<<<< HEAD
        --vim.g.sonokai_enable_italic = true
        vim.cmd.colorscheme('nordic')
        vim.inspect(vim.g.lightline)
=======
>>>>>>> e44c4e6 (Changed colorscheme to Nordic)

        local colorForSelection = "#F6C987"
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

