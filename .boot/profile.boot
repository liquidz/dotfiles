(require 'boot.repl)

(swap! boot.repl/*default-dependencies*
       concat '[[nrepl "0.4.5"]
                [cider/cider-nrepl "0.18.0"]
                [cider/orchard "0.3.0"]
                [cljfmt "0.6.0"]
                [refactor-nrepl "2.4.0"]
                [iced-nrepl "0.1.0"]])

(swap! boot.repl/*default-middleware*
       concat '[cider.nrepl/wrap-complete
                cider.nrepl/wrap-format
                cider.nrepl/wrap-info
                cider.nrepl/wrap-macroexpand
                cider.nrepl/wrap-ns
                cider.nrepl/wrap-out
                cider.nrepl/wrap-spec
                cider.nrepl/wrap-test
                cider.nrepl/wrap-undef
                refactor-nrepl.middleware/wrap-refactor
                iced.nrepl/wrap-iced])
