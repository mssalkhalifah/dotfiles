local M = {}

M.treesitter = {
   ensure_installed = {
      "css",
      "html",
      "tsx",
      "scss",
      "regex",
      "python",
      "php",
      "markdown",
      "lua",
      "json",
      "javascript",
      "godot_resource",
      "c",
      "c_sharp",
      "cpp",
      "bash",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },
}

return M
