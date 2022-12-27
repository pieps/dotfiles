local M = {}

function M.gh(url_fragment)
  return string.format('https://github.com/%s.git', url_fragment)
end

return M
