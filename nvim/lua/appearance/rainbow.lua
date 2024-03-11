local status, rainbow = pcall(require, 'rainbow-delimiters')
if not status then
  return
end

vim.g.rainbow_delimiters = {
  strategy = {
    [''] = rainbow.strategy['global'],
    vim = rainbow.strategy['local']
  },
  query = {
    [''] = 'rainbow-delimiters',
    lua = 'rainbow-blocks',
  },
  highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    'RainbowDelimiterOrange',
    'RainbowDelimiterGreen',
    'RainbowDelimiterViolet',
    'RainbowDelimiterCyan',
  }
}

