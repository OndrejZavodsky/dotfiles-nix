return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- stable releases
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand("~/Notes/personal") .. "/*.md",
    "BufNewFile " .. vim.fn.expand("~/Notes/personal") .. "/*.md",
    "BufReadPre " .. vim.fn.expand("~/Notes/work_and_school") .. "/*.md",
    "BufNewFile " .. vim.fn.expand("~/Notes/work_and_school") .. "/*.md",
  }, -- load only for markdown files
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Notes/personal", -- your Obsidian vault path
      },
      {
        name = "work_and_school",
        path = "~/Notes/work_and_school",
      }
      -- {                              -- optional second workspace
      --   name   = "work",
      --   path   = "~/vaults/work",
      -- },
    },
  },
}
