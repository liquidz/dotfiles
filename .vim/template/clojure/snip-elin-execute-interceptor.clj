; ==FILE== /Users/iizukamasashi/src/github.com/liquidz/dotfiles/.vim/template/clojure/snip-elin-execute-interceptor.clj
(let [context (-> (e.u.map/select-keys-by-namespace elin :component)
                  (assoc :foo "bar"))]
  (e.p.interceptor/execute interceptor e.c.interceptor/execute context (fn [ctx] ctx)))
;; ==FILE== END
