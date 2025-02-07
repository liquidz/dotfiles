import type { Plug } from "jsr:@yukimemi/dvpm@^6.2.2";

type Profile = "default" | "vim" | "neovim";

export type Plugin = Plug & {
  profiles: Profile[];
};
