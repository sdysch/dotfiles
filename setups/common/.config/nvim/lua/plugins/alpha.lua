return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    -- Wave logo animation
    local logo = {
      "███╗   ██╗██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██║   ██║██║████╗ ████║",
      "██╔██╗ ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
    }

    local frames = {}
    local height = #logo
    local width = #logo[1]

    for shift = 0, width-1 do
      local frame = {}
      for i, line in ipairs(logo) do
        local new_line = line:sub(shift+1) .. line:sub(1, shift)
        table.insert(frame, new_line)
      end
      table.insert(frames, frame)
    end

    local frame = 1
    dashboard.section.header.val = frames[frame]
    -- Updated bookmarks
    dashboard.section.buttons.val = {
      dashboard.button('f', '󰍉  Find file', ':lua require(\'fzf-lua\').files()<CR>'),
      dashboard.button('r', '  Find recent files', ':lua require(\'fzf-lua\').oldfiles()<CR>'),
      dashboard.button('t', '  Browse cwd', ':NvimTreeOpen<CR>'),
      dashboard.button('p', '  Plugins', ':Lazy<CR>'),
      dashboard.button('q', '󰅙  Quit', ':qa!<CR>'),
    }

    -- Git-aware + Lazy footer
    local function git_info()
      local branch = vim.fn.system('git branch --show-current 2>/dev/null'):gsub('%s+', '')
      if branch == '' then return '' end
      local dirty = vim.fn.system('git status --porcelain 2>/dev/null')
      return ' ' .. branch .. (dirty ~= '' and ' +' or '')
    end

    dashboard.section.footer.val = function()
      local stats = require('lazy').stats()
      return string.format('%s  ⚡ %d plugins in %.2f ms', git_info(), stats.count, stats.startuptime)
    end

    dashboard.section.buttons.opts.hl = 'Keyword'
    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)

    -- Wave animation timer
    local timer = vim.loop.new_timer()
    timer:start(0, 100, vim.schedule_wrap(function()
      if vim.bo.filetype ~= 'alpha' then return end
      frame = (frame % #frames) + 1
      dashboard.section.header.val = frames[frame]
      alpha.redraw()
    end))
  end,
}
