{:user
 {
  ;; vim-iced
   :dependencies [
                  [cider/cider-nrepl "0.17.0"]
                  [cljfmt  "0.6.0"]]
   :repl-options {:nrepl-middleware [
                                     ;cider.nrepl/wrap-complete
                                     ;cider.nrepl/wrap-format
                                     ;cider.nrepl/wrap-info
                                     ;cider.nrepl/wrap-inspect
                                     ;cider.nrepl/wrap-macroexpand
                                     ;cider.nrepl/wrap-ns
                                     ;cider.nrepl/wrap-test
                                     ;cider.nrepl/wrap-out
                                     ;cider.nrepl/wrap-stacktrace


                                     cider.nrepl/wrap-complete
                                     cider.nrepl/wrap-format
                                     cider.nrepl/wrap-info
                                     cider.nrepl/wrap-macroexpand
                                     cider.nrepl/wrap-ns
                                     cider.nrepl/wrap-out
                                     cider.nrepl/wrap-spec
                                     cider.nrepl/wrap-test
                                     cider.nrepl/wrap-undef

                                     ; cider.nrepl/wrap-apropos
                                     ; cider.nrepl/wrap-classpath
                                     ; cider.nrepl/wrap-complete
                                     ; cider.nrepl/wrap-debug
                                     ; cider.nrepl/wrap-format
                                     ; cider.nrepl/wrap-info
                                     ; cider.nrepl/wrap-inspect
                                     ; cider.nrepl/wrap-macroexpand
                                     ; cider.nrepl/wrap-ns
                                     ; cider.nrepl/wrap-spec
                                     ; cider.nrepl/wrap-pprint
                                     ; cider.nrepl/wrap-pprint-fn
                                     ; cider.nrepl/wrap-profile
                                     ; cider.nrepl/wrap-refresh
                                     ; cider.nrepl/wrap-resource
                                     ; cider.nrepl/wrap-stacktrace
                                     ; cider.nrepl/wrap-test
                                     ; ;cider.nrepl/wrap-trace
                                     ; cider.nrepl/wrap-out
                                     ; cider.nrepl/wrap-undef
                                     ; cider.nrepl/wrap-version 
                                     ]}
  :plugins [[refactor-nrepl "2.4.0-SNAPSHOT"]
                  ;[cider/cider-nrepl "0.17.0"]

            [lein-ancient "0.6.15"]
            [lein-codox         "0.10.4"]
            ]



  :signing {:gpg-key "A7FD4FFE"}
  }}
