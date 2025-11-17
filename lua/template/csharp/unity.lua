vim.api.nvim_create_autocmd("FileType", {
    pattern = "cs",
    callback = function()
        vim.keymap.set("n", "<leader>us", function()
            local filename = vim.fn.expand("%:t:r")
            -- filename = filename:gsub("^%l", string.upper)
            local lines = {
                "using UnityEngine;",
                "",
                "public class " .. filename .. " : MonoBehaviour",
                "{",
                "    void Start()",
                "    {",
                "    }",
                "",
                "    void Update()",
                "    {",
                "    }",
                "}",
            }
            vim.api.nvim_buf_set_lines(0, 0, -1, false, lines) -- 直接替换整个 buffer 内容
            -- vim.api.nvim_put(lines, "l", true, true)
        end, { buffer = true, desc = "Insert Unity Script template" }, { silent = true })
    end,
})
