-- =======================
-- Neoformat configuration
-- =======================

vim.g.neoformat_run_all_formatters = 1

-- JSON
vim.g.neoformat_json_jq = {
    exe = 'jq',
    stdin = 1,
    args = { '--indent', '4', '.' }
}

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
