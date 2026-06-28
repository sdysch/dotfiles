return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "AndreM222/copilot-lualine",
  },
  config = function()
    local lualine = require("lualine")

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_lsp" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " " },
      colored = true,
      update_in_insert = false,
      always_visible = true,
      cond = function()
        return vim.bo.filetype ~= "markdown"
      end,
    }

    local diff = {
      "diff",
      colored = true,
      symbols = { added = " ", modified = " ", removed = " " },
    }

    local mode = {
      "mode",
      fmt = function(str)
        return "-- " .. str .. " --"
      end,
    }

    local branch = {
      "branch",
      icon = "",
    }

    local function progress()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local chars = { "", "", "" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index] .. " " .. math.floor(line_ratio * 100) .. "%%"
    end

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard" },
        always_divide_middle = true,
      },

      sections = {
        lualine_a = { branch },
        lualine_b = { mode, diagnostics, "filename" },
        lualine_c = {
          {
            "copilot",
            symbols = {
              status = {
                icons = {
                  enabled = "🤖✅",
                  disabled = "🤖❌",
                  warning = "🤖⚠️",
                  unknown = "🤖❓",
                },
              },
            },
          },
          {
            require("opencode").statusline,
            fmt = function(str)
              if not str or str == "" then
                return ""
              end
              -- return '󰚩 ' .. str
              return str
            end,
            color = { fg = "#7aa2f7" },
          },
        },
        lualine_x = { diff, "fileformat", "filetype" },
        lualine_y = { "location" },
        lualine_z = { progress },
      },

      extensions = { "nvim-tree" },
    })
  end,
}
