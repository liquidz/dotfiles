{:user
 {
   ; vim-iced
   :dependencies [[cider/cider-nrepl "0.18.0"]
                  [cider/orchard "0.3.0"]
                  [cljfmt "0.6.0"]]
   :repl-options {:nrepl-middleware [
                                     cider.nrepl/wrap-complete
                                     cider.nrepl/wrap-format
                                     cider.nrepl/wrap-info
                                     cider.nrepl/wrap-macroexpand
                                     cider.nrepl/wrap-ns
                                     cider.nrepl/wrap-out
                                     cider.nrepl/wrap-spec
                                     cider.nrepl/wrap-test
                                     cider.nrepl/wrap-undef

                                     ; ;cider.nrepl/wrap-pprint
                                     ; ;cider.nrepl/wrap-pprint-fn
                                     ]}
  :plugins [
            [refactor-nrepl "2.4.0-SNAPSHOT"]

            [lein-ancient "0.6.15"]
            [lein-codox "0.10.4"]
            [lein-pprint "1.2.0"]
            ]



  :signing {:gpg-key "A7FD4FFE"}
  }}
