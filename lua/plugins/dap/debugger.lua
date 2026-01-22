local dap = require 'dap'
local vstuc_path = "C:/Users/scx18/.vscode/extensions/visualstudiotoolsforunity.vstuc-1.2.1/bin/"

-- NOTE: configure adapters
dap.adapters.codelldb = {
    type = 'executable',
    command = 'codelldb', -- or if not in $PATH: "/absolute/path/to/codelldb"
}

dap.adapters.unity = {
    type = 'executable',
    command = 'dotnet',
    args = { vstuc_path .. "UnityDebugAdapter.dll" },
    name = 'Attach to Unity',
}


-- NOTE: filetype configurations
dap.configurations.cpp = {
    {
        name = "Launch (codelldb)",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    }
}

dap.configurations.cs = {
    {
        type = 'unity',
        request = 'attach',
        name = 'Attach to Unity (apply me!)',
        logFile = vim.fs.joinpath(vim.fn.stdpath('data')) .. '/vstuc.log',
        projectPath = function()
            local path = vim.fn.expand('%:p')
            while true do
                local new_path = vim.fn.fnamemodify(path, ':h')
                if new_path == path then
                    return ''
                end
                path = new_path
                local assets = vim.fn.glob(path .. '/Assets')
                if assets ~= '' then
                    print("Project path found for dap : " .. path)
                    return path
                end
            end
        end,
        endPoint = function()
            local system_obj = vim.system({ 'dotnet', vstuc_path .. 'UnityAttachProbe.dll' }, { text = true })
            local probe_result = system_obj:wait(2000).stdout
            if probe_result == nil or #probe_result == 0 then
                print('No endpoint found (is unity running?)')
                return ''
            end
            for json in vim.gsplit(probe_result, '\n') do
                if json ~= '' then
                    local probe = vim.json.decode(json)
                    for _, p in pairs(probe) do
                        if p.isBackground == false then
                            return p.address .. ':' .. p.debuggerPort
                        end
                    end
                end
            end
            return ''
        end
    },
}
