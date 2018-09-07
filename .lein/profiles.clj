{:user
 {
   ; vim-iced
   :dependencies [
                  [nrepl "0.4.5"]
                  [cider/cider-nrepl "0.18.0"]
                  ;;[cider/orchard "0.3.0"]
                  ;;[cljfmt "0.6.0"]
                  [iced-nrepl "0.1.0-SNAPSHOT"]
                  [jonase/eastwood "0.2.9" :exclusions [org.clojure/clojure]]
                  ]
   :repl-options {:nrepl-middleware [
                                     cider.nrepl/wrap-complete
                                     cider.nrepl/wrap-debug
                                     cider.nrepl/wrap-format
                                     cider.nrepl/wrap-info
                                     cider.nrepl/wrap-macroexpand
                                     cider.nrepl/wrap-ns
                                     cider.nrepl/wrap-out
                                     cider.nrepl/wrap-pprint
                                     cider.nrepl/wrap-pprint-fn
                                     cider.nrepl/wrap-spec
                                     cider.nrepl/wrap-test
                                     cider.nrepl/wrap-trace
                                     cider.nrepl/wrap-undef
                                     iced.nrepl/wrap-iced
                                     ]}
  :plugins [
            [refactor-nrepl "2.4.0"]

            [lein-ancient "0.6.15"]
            [lein-codox "0.10.4"]
            [lein-pprint "1.2.0"]
            ]



  :signing {:gpg-key "A7FD4FFE"}
  }}
