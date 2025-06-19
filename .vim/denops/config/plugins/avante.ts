import type { Plugin } from "../type.ts";

export const avantePlugins: Plugin[] = [
  //{ url: "nvim-treesitter/nvim-treesitter", profiles: ["neovim"] },
  { url: "stevearc/dressing.nvim", profiles: ["neovim"] },
  //{ url: "nvim-lua/plenary.nvim", profiles: ["neovim"] },
  { url: "MunifTanjim/nui.nvim", profiles: ["neovim"] },
  { url: "MeanderingProgrammer/render-markdown.nvim", profiles: ["neovim"] },

  {
    url: "yetone/avante.nvim",
    profiles: ["neovim"],
    rev: "main",
    dependencies: [
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      // OPTIONAL
      "nvim-telescope/telescope.nvim",
      "zbirenbaum/copilot.lua",
    ],
    //build: 'make',
    cache: {
      after: `lua << EOB
        require('avante').setup({
          provider = "copilot",

        })
      EOB`,
    },
  },
];
