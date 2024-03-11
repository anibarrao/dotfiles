local status_ok, utils = pcall(require, "lspconfig/util")
if not status_ok then
  return
end

return {
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = utils.root_pattern{"go.work", "go.mod", ".git"},
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
