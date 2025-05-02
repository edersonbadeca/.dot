vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
]])

--require('telescope.builtin').find_files({ hidden = true })
require'lspconfig'.terraformls.setup{}
-- Carregar configurações gerais
require('settings')

-- Configurar plugins
require('plugins')

-- Configurações do LSP
require('lsp')

require('telescope').setup {
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            preview_cutoff = 0, -- Evita preview muito pequeno
            height = 0.9, -- Usa 90% da tela
            width = 0.9 -- Usa 90% da tela
        },
        hidden = true, -- Permite arquivos ocultos
    }
}

local lspconfig = require("lspconfig")

lspconfig.yamlls.setup {
    settings = {
        yaml = {
            schemas = {
                kubernetes = "/*.k8s.yaml", -- Suporte a Kubernetes YAML
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://json.schemastore.org/github-action.json"] = "/.github/action.yaml",
                ["https://json.schemastore.org/compose.json"] = "docker-compose*.yml",
            },
            validate = true,
            completion = true,
            hover = true,
        },
    },
}

-- Copilot base
require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

-- Copilot Chat
require("CopilotChat").setup()

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright" },
})

require("lspconfig").pyright.setup({})

local chat_bufnr = nil

function ToggleCopilotChat()
  -- Verifica se o chat já está aberto
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local bufname = vim.api.nvim_buf_get_name(buf)
    if bufname:match("CopilotChatPrompt") then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
  -- Se não estiver aberto, abre
  vim.cmd("CopilotChat")
end

-- Mapeia para <leader>cc (ou troque como quiser)
vim.keymap.set("n", "<leader>cc", ToggleCopilotChat, { desc = "Toggle Copilot Chat" })
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { buffer = 0 })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renomear com LSP" })

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Formatar com LSP" })

