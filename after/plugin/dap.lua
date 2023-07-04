local dap, dapui = require("dap"), require("dapui")

dapui.setup({
        controls = {
            element = "repl",
            enabled = true,
            icons = {
                disconnect = "",
                pause = "",
                play = "",
                run_last = "",
                step_back = "",
                step_into = "",
                step_out = "",
                step_over = "",
                terminate = ""
            }
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
            border = "single",
            mappings = {
                close = { "q", "<Esc>" }
            }
        },
        force_buffers = true,
        icons = {
            collapsed = "",
            current_frame = "",
            expanded = ""
        },
        layouts = { {
                elements = { {
                        id = "scopes",
                        size = 0.40
                    }, {
                        id = "breakpoints",
                        size = 0.20
                    }, {
                        id = "stacks",
                        size = 0.15
                    }, {
                        id = "watches",
                        size = 0.25
                } },
                position = "left",
                size = 45
            }, {
                elements = { {
                        id = "repl",
                        size = 0.5
                    }, {
                        id = "console",
                        size = 0.5
                } },
                position = "bottom",
                size = 15
        } },
        mappings = {
            edit = "e",
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            repl = "r",
            toggle = "t"
        },
        render = {
            indent = 1,
            max_value_lines = 100
        }
    })
require("dap-go").setup({
        dap_configurations = {
            {
                type = "go",
                name = "Debug - Current File",
                mode = "debug",
                request = "launch",
                console = "integratedTerminal",
                program = "${workspaceFolder}/main.go",
            },
        },
    })

vim.keymap.set("n", "<leader>dt", function() require("dapui").toggle() end, { noremap = true })
vim.keymap.set("n", "<leader>di", function() require("dapui").eval() end, { noremap = true })
vim.keymap.set("n", "<F3>", function() require("dapui").open({reset = true}) end, { noremap = true })
vim.keymap.set("n", "<F4>", ":DapTerminate<CR>", { noremap = true })
vim.keymap.set("n", "<F5>", ":DapContinue<CR>", { noremap = true })
vim.keymap.set("n", "<F9>", ":DapToggleBreakpoint<CR>", { noremap = true })
vim.keymap.set("n", "<F10>", ":DapStepOver<CR>", { noremap = true })
vim.keymap.set("n", "<F11>", ":DapStepInto<CR>", { noremap = true })
vim.keymap.set("n", "<F12>", ":DapStepOut<CR>", { noremap = true })
vim.keymap.set("n", "<leader>dr", ":DapRestart<CR>", { noremap = true })

vim.fn.sign_define('DapBreakpoint', {
        text = '🔴',
        texthl = 'DapBreakpoint',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint',
    })

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end


vim.g.dotnet_build_project = function()
    local default_path = vim.fn.getcwd() .. '/'
    if vim.g['dotnet_last_proj_path'] ~= nil then
        default_path = vim.g['dotnet_last_proj_path']
    end
    local path = vim.fn.input('Path to your *proj file', default_path, 'file')
    vim.g['dotnet_last_proj_path'] = path
    local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
    print('')
    print('Cmd to execute: ' .. cmd)
    local f = os.execute(cmd)
    if f == 0 then
        print('\nBuild: ✔️ ')
    else
        print('\nBuild: ❌ (code: ' .. f .. ')')
    end
end

vim.g.dotnet_get_dll_path = function()
    local request = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end

    if vim.g['dotnet_last_dll_path'] == nil then
        vim.g['dotnet_last_dll_path'] = request()
    else
        if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
            vim.g['dotnet_last_dll_path'] = request()
        end
    end

    return vim.g['dotnet_last_dll_path']
end

local config = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
                vim.g.dotnet_build_project()
            end
            return vim.g.dotnet_get_dll_path()
        end,
    },
}


if vim.fn.has('unix') then
    dap.adapters.coreclr = {
        type = 'executable',
        command = '/home/vorak/bin/netcoredbg/netcoredbg',
        args = {'--interpreter=vscode'}
    }
else
    dap.adapters.coreclr = {
        type = 'executable',
        command = 'C:/bins/netcoredbg/netcoredbg.exe',
        args = {'--interpreter=vscode'}
    }
end
dap.configurations.cs = config
dap.configurations.fsharp = config
