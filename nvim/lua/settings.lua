vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- GITHUB ACTIONS

vim.api.nvim_create_autocmd("FileType", {
  pattern = "github-actions-workflow",
  callback = function()
    vim.lsp.start({
      name = "gh-actions-ls",
      filetypes = { "github-actions-workflow" },
      cmd = { "npx", "github-actions-languageserver", "--stdio" },
      root_dir = vim.fn.getcwd(),
      init_options = {
        sessionToken = vim.env.GITHUB_TOKEN or "",
      },
      settings = {},
    })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.yaml", "*.yml" },
    callback = function()
        vim.lsp.buf.format()
    end,
})


-- Set specify yaml files to be of type github-actions-workflow
vim.cmd("autocmd BufRead,BufNewFile *.github/workflows/*.yaml set filetype=github-actions-workflow")
vim.cmd("autocmd BufRead,BufNewFile *.github/workflows/*.yml set filetype=github-actions-workflow")
vim.treesitter.language.register("yaml", "github-actions-workflow")
