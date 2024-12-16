vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
]])

require'lspconfig'.terraformls.setup{}
-- Carregar configurações gerais
require('settings')

-- Configurar plugins
require('plugins')

-- Configurações do LSP
require('lsp')

