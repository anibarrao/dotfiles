local opt = vim.opt

opt.clipboard = "unnamedplus"                   -- Copy/paste/cut with OS
opt.expandtab = true                            -- Convert tabs to spaces
opt.ignorecase = true                           -- search is not casesensitive
opt.smartcase = true                            -- Override the 'ignorecase' option if the search pattern contains upper case characters
opt.number = true                               -- show number lines
opt.scrolloff = 8                               -- Minimal number of screen lines to keep above and below the cursor
opt.shiftwidth = 2                              -- Number of spaces
opt.cmdheight = 2                               -- more space in the nvim command lines for displating messages
opt.completeopt = {"menuone", "noselect"}       -- important for cmp 
opt.conceallevel = 0                            -- so that `` is visible in markdown files
opt.fileencoding = "utf-8"                      -- the encoding written to a file
opt.hlsearch = true                             -- highlight all matches on previous search pattern
opt.pumheight =10                               -- popup menu height
opt.showmode = false                            -- no 'INSERT', 'NORMAL' modes displayed
opt.showtabline = 2                             -- always show tabs
opt.smartindent = true                          -- indent is smart now
opt.splitbelow = true                           -- force split horizontally to be below actual window
opt.splitright = true                           -- force split vertically always to be to the right of current window
opt.swapfile = false                            -- no swpa file
opt.termguicolors = true                        -- set term gui colors
-- opt.cursorline = true                           -- highlight actual cursor line
opt.signcolumn = "yes"                          -- always shows the column 
opt.wrap = false                                -- no break lines
vim.g.history = 1000
opt.shortmess:append "c"

-- Add chars to '%'
opt.matchpairs = "(:),{:},[:],<:>,':'"

vim.cmd([[set iskeyword+=-]])

-- Wil load the configuration for each file in ftplugin
vim.cmd("filetype plugin on")

-- disable netwr
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

function goimports(timeoutsms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeoutsms)
  if not result or next(result) == nil then return end
  local actions = result[1].result
  if not actions then return end
  local action = actions[1]

  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit)
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end
