return {
    -- 'sainnhe/sonokai',
    'jacoborus/tender.vim',

    lazy = false,
    priority = 1000,
    config = function()
        --vim.g.sonokai_enable_italic = true
        vim.cmd.colorscheme('tender')
        vim.inspect(vim.g.lightline)

        vim.cmd [[g:lightline = { 'colorscheme': 'tender' }]]
        vim.api.nvim_set_hl(0, 'Normal', {bg = 'none'})
        vim.api.nvim_set_hl(0, 'NormalFloat', {bg = 'none'})
    end
}
