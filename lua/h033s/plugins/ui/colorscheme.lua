return {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.sonokai_enable_italic = true
        vim.cmd.colorscheme('sonokai')
        vim.api.nvim_set_hl(0, 'Normal', {bg = 'none'})
        vim.api.nvim_set_hl(0, 'NormalFloat', {bg = 'none'})
    end
}
