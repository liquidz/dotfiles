import type { Plugin } from "../type.ts";

export const nvimDeckPlugins: Plugin[] = [
  {
    url: "hrsh7th/nvim-deck",
    profiles: ["neovim"],
    cache: { afterFile: "~/.vim/conf.d/after/nvim-deck.lua" },
  },
  // {
  //   url: "liquidz/elin-nvim-deck",
  //   dst: "~/src/github.com/liquidz/elin-nvim-deck",
  //   profiles: ["neovim"],
  //   enabled: false,
  // },
];
