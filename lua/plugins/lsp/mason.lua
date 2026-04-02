return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "bashls",
        "terraformls", -- Terraform
        "yamlls", -- K8s, Ansible, GitHub Actions, docker-compose
        "ansiblels", -- Ansible playbooks
        "dockerls", -- Dockerfile
        "pyright", -- Python
        "gopls", -- Go
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "shfmt", -- bash formatter
        "eslint_d",
        "shellcheck", -- bash linter
        "tflint", -- Terraform linter
        "hadolint", -- Dockerfile linter
        "ansible-lint", -- Ansible linter
        "black", -- python formatter
        "isort", -- python import sorter
        "pylint", -- python linter
        "gofumpt", -- go formatter
        "goimports", -- go import sorter
      },
    })
  end,
}
