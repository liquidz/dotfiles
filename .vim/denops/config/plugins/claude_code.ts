import type { Plugin } from "../type.ts";

export const claudeCodePlugins: Plugin[] = [
  {
    url: "folke/snacks.nvim",
    profiles: ["neovim"],
  },
  {
    url: "coder/claudecode.nvim",
    profiles: ["neovim"],
    dependencies: [
      "folke/snacks.nvim",
    ],
    cache: {
      after: `lua << EOB
        vim.keymap.set('n', '<Leader>ai', '<cmd>ClaudeCode --continue<CR>', { desc = 'Toggle Claude Code' })
        vim.keymap.set('n', '<Leader>aI', '<cmd>ClaudeCode<CR>', { desc = 'Toggle Claude Code' })
        vim.keymap.set('v', '<Leader>as', '<cmd>ClaudeCodeSend<CR>', { desc = 'Send to Claude' })

        vim.keymap.set('n', '<Leader>aa', '<cmd>ClaudeCodeDiffAccept<CR>', { desc = 'Accept diff' })
        vim.keymap.set('n', '<Leader>ad', '<cmd>ClaudeCodeDiffDeny<CR>', { desc = 'Deny diff' })
        require('claudecode').setup({
          git_repo_cwd = true,
          focus_after_send = true,
          terminal = {
            split_width_percentage = 0.5,
            provider = "snacks",
            snacks_win_opts = {},
          },
          diff_opts = {
            layout = "horizontal",
          },
        })
      EOB`,
    },
  },
];
