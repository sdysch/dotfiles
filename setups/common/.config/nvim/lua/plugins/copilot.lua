return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      "copilotlsp-nvim/copilot-lsp",
    },
    cmd = { "Copilot" },
    keys = { { "<leader>ct", "<Cmd>Copilot toggle<CR>", mode = "n", desc = "Copilot toggle" } },
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-l>",
            -- next = '<C-]>',
            -- prev = '<C-[>',
            -- dismiss = '<C-]>',
          },
        },
        filetypes = {
          markdown = true,
          python = true,
          lua = true,
          bash = true,
          zsh = true,
          sh = true,
          gitcommit = false,
          help = false,
        },
      })

      vim.keymap.set("n", "<leader>ct", "<Cmd>Copilot toggle<CR>", {
        noremap = true,
        silent = true,
        desc = "Toggle Copilot",
      })
    end,
  },
}
