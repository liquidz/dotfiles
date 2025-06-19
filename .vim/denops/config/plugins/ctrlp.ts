import type { Plugin } from "../type.ts";

export const ctrlpPlugins: Plugin[] = [
  {
    url: "ctrlpvim/ctrlp.vim",
    profiles: ["vim"],
    cache: {
      before: `
        let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
        let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
        let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く
        let g:ctrlp_show_hidden         = 1   " 隠しファイルも表示
        let g:ctrlp_match_window        = 'results:50'
        let g:ctrlp_follow_symlinks     = 1
        let g:ctrlp_lazy_update         = 100
        let g:ctrlp_custom_ignore = {
              \\   'dir' : '\\v[\\/](\\.git|cookbooks|target|Vendor|cache|node_modules|\\.cache|\\.cpcache|\\.shadow-cljs|\\.next)$',
              \\   'file': '\\v\\.(o|bk|org|exe|so|dll|skl|cgi|gitkeep|png|gif|jpg)$',
              \\   'link': 'some_bad_symbolic_links',
              \\ }
        let g:ctrlp_prompt_mappings = {
              \\ 'PrtCurLeft()'   : ['<c-b>', '<left>'],
              \\ 'PrtCurRight()'  : ['<c-f>', '<right>'],
              \\ 'PrtClearCache()': ['<c-l>'],
              \\ }
      `,
    },
  },
];
