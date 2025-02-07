; ==FILE== ~/src/github.com/liquidz/dotfiles/.vim/template/clojure/elin-interceprot.clj
(def fixme
  {:kind e.c.interceptor/evaluate
   :enter (-> (fn [{:as ctx :component/keys [nrepl]}]
                (let [config (e.u.interceptor/config ctx #'fixme)]
                  config))
              (ix/discard))})
;; ==FILE== END
