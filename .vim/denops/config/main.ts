import type { Denops } from "jsr:@denops/std";
import * as fn from "jsr:@denops/std/function";
import { ensure, is } from "jsr:@core/unknownutil";
import { Dvpm } from "jsr:@yukimemi/dvpm@^6.2.2";
import { plugins } from "./plugins.ts";

export async function main(denops: Denops): Promise<void> {
  const is_nvim = await fn.has(denops, "nvim");
  const base_path = "~/.vim/.dvpm-cache/";
  const cache_path = is_nvim
    ? "~/.config/nvim/plugin/dvpm_plugin_cache.vim"
    : "~/.config/vim/plugin/dvpm_plugin_cache.vim";

  const dvpm = await Dvpm.begin(denops, {
    base: ensure(await fn.expand(denops, base_path), is.String),
    cache: ensure(await fn.expand(denops, cache_path), is.String),
    profiles: ["default", is_nvim ? "neovim" : "vim"],
  });

  // await dvpm.add({
  //   url: "nvim-telescope/telescope.nvim",
  //   enabled: false,
  // });

  // const allPlugins: Plug[] = is_nvim
  //   ? plugins.filter((p) => p.target == null || p.target === "neovim")
  //   : plugins.filter((p) => p.target == null || p.target === "vim");
  // await Promise.all(allPlugins.map((p) => dvpm.add(p)));
  await Promise.all(plugins.map((p) => dvpm.add(p)));
  await dvpm.end();

  console.log("Load completed !");
}
