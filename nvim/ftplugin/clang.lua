vim.bo.comments = ':---,:--'

local lua_ls_cmd = 'clangd'

-- Check if lua-language-server is available
if vim.fn.executable(lua_ls_cmd) ~= 1 then
  return
end

local root_files = {
  'compile_commands.json',
  '.git',
}

vim.lsp.start {
  name = 'clangd',
  cmd = { lua_ls_cmd },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
  --settings = {
  --},
}
