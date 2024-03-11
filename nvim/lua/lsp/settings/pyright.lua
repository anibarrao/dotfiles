return {
  single_file_support = false,
  settings = {
    pyright = {
      autoImportCompletion = true
    },
    python = {
      analysis = {
        diagnosticMode = "workspace",
        typeCheckingMode = "standard",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
      venvPath = vim.env.VIRTUAL_ENV and vim.env.VIRTUAL_ENV or vim.env.PYENV_ROOT,
    }
  },
}
