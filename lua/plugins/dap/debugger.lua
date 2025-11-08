local dap = require 'dap'

-- NOTE: configure adapters
dap.adapters.codelldb = {
  type = 'executable',
  command = 'codelldb', -- or if not in $PATH: "/absolute/path/to/codelldb"
}


-- NOTE: filetype configurations
dap.configurations.cpp = {
    {
        name = "Launch (codelldb)",
        type = "codelldb",
        request = "launch",
        program = function ()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    }
}
