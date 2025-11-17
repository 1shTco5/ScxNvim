vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        vim.keymap.set("n", "<leader>ct", function()
            local current_file = vim.fn.expand("%:p")
            local current_dir = vim.fn.fnamemodify(current_file, ":h")
            local current_dir_slash = current_dir:gsub("\\", "/")

            -- Create /build Folder
            local build_dir = current_dir .. "/build"
            local stat_build = vim.loop.fs_stat(build_dir)
            if not stat_build then
                local ok, err = vim.loop.fs_mkdir(build_dir, 493) -- 493 = 0o755 permissions
                if not ok then
                    print("Failed to create build directory: " .. (err or "unknown error"))
                end
            end
            -- Create CMakeLists.txt File
            local cmakelists_file_path = current_dir .. "/CMakeLists.txt"
            local cmakelists_lines = {
                "cmake_minimum_required(VERSION 3.10)",
                "",
                "project(MyProject)",
                "",
                "include_directories(\"./include/\")",
                "",
                "set(MY_EXECUTABLE_NAME \"main\")",
                "set(",
                "  SOURCE_FILES",
                "  \"./main.cpp\"",
                "  #\"./include/print.cpp\"",
                ")",

                "add_executable(${MY_EXECUTABLE_NAME} ${SOURCE_FILES})"
            }
            -- Create /include Folder
            local include_dir = current_dir .. "/include"
            local stat_include = vim.loop.fs_stat(include_dir)
            if not stat_include then
                local ok, err = vim.loop.fs_mkdir(include_dir, 493) -- 493 = 0o755 permissions
                if not ok then
                    print("Failed to create include directory: " .. (err or "unknown error"))
                end
            end
            -- Create .clangd file
            local clangd_file_path = current_dir .. "/.clangd"
            local clangd_lines = {
                "CompileFlags:",
                "  Add: [",
                "      -DUNICODE,",
                "      -D_UNICODE,",
                "      \"-std=c++17\", # needed when using MSVC",
                "      # you should replace this to your own include path of this project",
                "      \"-I" .. current_dir_slash .. "/include/\",",
                "",
                "      # -Wno-microsoft-goto,",
                "      # -Wno-nonportable-include-path,",
                "      # -Wno-microsoft-extra-qualification,",
                "      # -Wunused-variable,",
                "",
                "      # -Wno-unused-value,",
                "    ] # ignore some specific warnings",
                "",
                "CompilationDatabase: build/ # Search build/ directory for compile_commands.json",
            }
            vim.cmd("enew")
            vim.api.nvim_buf_set_lines(0, 0, -1, false, cmakelists_lines)
            vim.cmd("file " .. cmakelists_file_path)
            print("CMakeLists.txt created at: " .. cmakelists_file_path)

            vim.cmd("enew")
            vim.api.nvim_buf_set_lines(0, 0, -1, false, clangd_lines)
            vim.cmd("file " .. clangd_file_path)
            print(".clangd created at: " .. clangd_file_path)
        end, { buffer = true, desc = "Create CMakeLists.txt in current directory" })
    end,
})
