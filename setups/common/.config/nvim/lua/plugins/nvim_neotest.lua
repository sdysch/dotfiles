return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python"
  },
  keys = {
    { "<leader>tr", function() require("neotest").run.run() end, desc = "Neotest: run nearest test" },
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand('%')) end, desc = "Neotest: run tests in file" },
    { "<leader>ta", function() require("neotest").run.run({ suite = true }) end, desc = "Neotest: run all tests" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Neotest: toggle summary" },
    { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Neotest: run last test" },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
          args = {"--log-level", "DEBUG"},
          runner = "pytest",
          python = ".venv/bin/python",
          pytest_discover_instances = true,
        })
      },
      icons = {
        passed = "✔",
        running = "⏱",
        failed = "✖",
        skipped = "➟",
        unknown = "?"
      },
      quickfix = {
        enabled = false,
      },
    })

    -- Make sure the sign column is always visible
    vim.o.signcolumn = "yes"
  end
}
