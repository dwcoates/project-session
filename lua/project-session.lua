local function check_no_save_session_arg()
    local args = vim.v.argv
    for _, arg in ipairs(args) do
        if arg == "no-save-session" then
            return true
        end
    end
    return false
end

function save_session()
    local git_root = vim.fn.system("echo -n $(git rev-parse --show-toplevel)")
    local session_file = git_root .. "/.nvim-session.vim"
    vim.cmd("mksession! " .. session_file)
end

function clear_session()
    vim.cmd('%bd!')
    save_session()
end

if not check_no_save_session_arg() then
  vim.cmd("autocmd BufWritePost * lua save_session()")
  vim.cmd([[autocmd VimLeavePre * SaveSession]])
  vim.cmd("command! SaveSession lua save_session()")
  vim.cmd("command! ClearSession lua clear_session()")
end
