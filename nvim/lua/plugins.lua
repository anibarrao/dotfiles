local fn = vim.fn

-- Automatically install packer if it is not installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.notify("Installing packer, close and reopen nVim")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocmd that reloads neovim after saving packages.lua
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


-- Protected call to do not fuck up first nVim use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- Install plugins here
return packer.startup(function(use)
  -- Packer plugins
  use "wbthomason/packer.nvim" --Packer 
  use "nvim-lua/popup.nvim" --PopUP API
  use "nvim-lua/plenary.nvim" --Lua functions used in a bunch of plugins

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  --colorschemes
  use "navarasu/onedark.nvim"
  
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
