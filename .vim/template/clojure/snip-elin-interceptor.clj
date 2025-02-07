; ==FILE== /Users/iizukamasashi/src/github.com/liquidz/dotfiles/.vim/template/clojure/snip-elin-interceptor.clj
(def fixme
  "FIXME.

  .Configuration
  [%autowidth.stretch]
  |===
  | key | type | description

  | foo | string | bar.
  |==="
  {:kind e.c.interceptor/evaluate
   :enter (-> (fn [{:as ctx :component/keys [nrepl]}]
                (let [config (e.u.interceptor/config ctx #'fixme)]
                  config))
              (ix/discard))})
;; ==FILE== END
