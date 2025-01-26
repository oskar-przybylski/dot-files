require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
    cmd = { "clangd" }, -- Ensure it uses the system-installed clangd
    on_attach = function(client, bufnr)
        -- Add any custom `on_attach` settings here
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(), -- If using nvim-cmp
}

