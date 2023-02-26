-- =======================
-- Neoformat configuration
-- =======================

vim.g.neoformat_run_all_formatters = 1

-- Uncomment for debugging.
--vim.g.neoformat_verbose = 1

-- YAML
vim.g.neoformat_yaml_yamlfix = {
    exe = 'yamlfix',
    stdin = 1,
    args = { '-' }
}
vim.g.neoformat_enabled_yaml = {'yamlfix'}

-- SQL
vim.g.neoformat_sql_sqlformat = {
    exe = 'sqlformat',
    stdin = 1,
    args = { '--reindent', '--keywords', 'upper', '-' }
}

-- Perl
vim.g.neoformat_perl_perltidy = {
    exe = 'perltidy',
    args = { '-q' },
    stdin = 1
}

-- TypeScript
vim.g.neoformat_typescript_prettier = {
    exe = 'npx',
    stdin = 1,
    args = { '-q', 'prettier', '--parser', 'typescript', '--tab-width', '4' }
}
