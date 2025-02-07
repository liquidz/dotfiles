import type { Plugin } from "../type.ts";

export const telescopePlugins: Plugin[] = [
  {
    url: "nvim-telescope/telescope.nvim",
    profiles: ["neovim"],
    rev: "0.1.8",
    dependencies: [
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    ],
    cache: {
      afterFile: "~/.vim/conf.d/after/telescope.lua",
    },
  },

  {
    url: "nvim-telescope/telescope-ui-select.nvim",
    profiles: ["neovim"],
  },

  {
    url: "nvim-telescope/telescope-fzf-native.nvim",
    profiles: ["neovim"],
    build: async ({ info }) => {
      if (!info.isUpdate || !info.isLoad) {
        // build option is called after git pull, even if there are no changes
        // so you need to check for changes
        return;
      }

      // FIXME ちゃんと動いてなさそう
      const cmd1 = new Deno.Command("cmake", {
        args: ["-S.", "-Bbuild", "-DCMAKE_BUILD_TYPE=Release"],
      });
      console.log(new TextDecoder().decode((await cmd1.output()).stdout));
      const cmd2 = new Deno.Command("cmake", {
        args: ["--build", "build", "--config", "Release"],
      });
      console.log(new TextDecoder().decode((await cmd2.output()).stdout));
    },
  },

  {
    url: "liquidz/elin-telescope.nvim",
    dst: "~/src/github.com/liquidz/elin-telescope.nvim",
    profiles: ["neovim"],
  },
];
