local dap, dapui = require("dap"), require("dapui")

dap.listeners.before.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- customize UI layout
dapui.setup {
    expand_lines = false,
    layouts = {
        {
            position = 'left',
            size = 0.2,
            elements = {
                { id = 'stacks',      size = 0.2 },
                { id = 'scopes',      size = 0.5 },
                { id = 'breakpoints', size = 0.15 },
                { id = 'watches',     size = 0.15 },
            },
        },
        {
            position = 'bottom',
            size = 0.2,
            elements = {
                { id = 'repl',    size = 0.3 },
                { id = 'console', size = 0.7 },
            },
        },
    },
}

-- Custom breakpoint icons
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = 'DapBreakpoint' })
vim.fn.sign_define(
    'DapBreakpointCondition',
    { text = '', texthl = 'DapBreakpointCondition', linehl = 'DapBreakpointCondition', numhl = 'DapBreakpointCondition' }
)
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

-- keymaps
vim.keymap.set('n', '<leader>du', function()
    dapui.toggle({ reset = true })
    custom_utils.reset_overseerlist_width()
end, { desc = 'DAP: Toggle UI' })
-- vim.keymap.set('n', '<F1>', function ()
--  dapui.toggle({reset = true})
--  custom_utils.reset_overseerlist_width()
-- end, { desc = 'DAP: Toggle UI' })
vim.keymap.set('n', '<F1>', dap.continue, { desc = ' Start/Continue' })
vim.keymap.set('n', '<F2>', dap.step_over, { desc = ' Step over' })
vim.keymap.set('n', '<F3>', dap.step_into, { desc = ' Step into' })
vim.keymap.set('n', '<F4>', dap.step_out, { desc = ' Step out' })
vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, { desc = 'DAP: Breakpoint' })
