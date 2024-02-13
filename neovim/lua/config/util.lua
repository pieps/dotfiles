local M = {
  search_dirs = nil
}

function M.gh(url_fragment)
  return string.format('https://github.com/%s.git', url_fragment)
end

function M.qfix_toggle(forced)
  local qfinfo = vim.fn.getqflist({ winid = 1 })
  if qfinfo.winid ~= 0 and not forced then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end

function M.toggle_test_java(split)
  local cur_file = vim.fn.expand('%:p')
  local new_file = nil
  if cur_file:find('javatests/') then
    new_file = cur_file:gsub('javatests/', 'java/', 1):gsub('Test%.(.+)$', '.%1')
  elseif cur_file:find('java/') then
    new_file = cur_file:gsub('java/', 'javatests/', 1):gsub('%.(.+)$', 'Test.%1')
  end

  local win_nr = vim.fn.winnr('$')
  if not split or win_nr > 1 then
    local win_id = vim.fn.bufwinid(vim.fn.bufnr(new_file))
    if win_id ~= -1 then
      vim.fn.win_gotoid(win_id)
    else
      vim.cmd('edit ' .. vim.fn.fnameescape(new_file))
    end
  else
    vim.cmd('vs ' .. vim.fn.fnameescape(new_file))
  end
end

function M.find_search_dirs()
  if M.search_dirs then
    return M.search_dirs
  end
  M.search_dirs = {}
  local loaded, dirs = pcall(require, 'neo.search_dirs')
  if loaded then
    for key, value in pairs(dirs) do
      if vim.fn.getcwd():sub(- #key) == key then
        M.search_dirs = value
        break
      end
    end
  end
  return M.search_dirs
end

return M
