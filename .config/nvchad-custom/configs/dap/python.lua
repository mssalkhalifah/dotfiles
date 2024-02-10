local path = vim.fn.expand("$HOME") .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python"

require("dap-python").setup(path)
