-- setup adapters
require('dap-vscode-js').setup({
    debugger_path = vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter',
    debugger_cmd = { 'js-debug-adapter' },
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})
local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue",
}
-- setup adapters
require("mason-nvim-dap").setup({
    ensure_installed = { "python", "js" }
})
local dap = require('dap')

dap.set_log_level('TRACE')

dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = vim.fn.exepath "js-debug-adapter",
        args = { "${port}" },
    },
}
-- language config
for _, language in ipairs({ 'typescript' }) do
    dap.configurations[language] = {
        {
            name = 'Launch',
            type = 'pwa-node',
            request = 'launch',
            program = '${file}',
            rootPath = '${workspaceFolder}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            skipFiles = { '<node_internals>/**' },
            protocol = 'inspector',
            console = 'integratedTerminal',
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Auto Attach",
            cwd = vim.fn.getcwd(),
            userDataDir = false,
            webRoot = '${workspaceFolder}'
        },
}
end

-- Load lauch.json files from .vscode directories
local load_launch = function()
          if vim.fn.filereadable(".vscode/launch.json") then
            local dap_vscode = require("dap.ext.vscode")
            dap_vscode.load_launchjs(nil, {
              ["pwa-node"] = js_based_languages,
              ["chrome"] = js_based_languages,
              ["pwa-chrome"] = js_based_languages,
            })
          end
          require("dap").continue()
end

-- Keymaps
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dc', load_launch)
vim.keymap.set('n', '<leader>ds', dap.step_over)
