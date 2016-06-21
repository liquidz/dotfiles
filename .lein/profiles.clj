{:user
 {:plugins [
            [lein-ancient                "RELEASE"]
            [jonase/eastwood             "RELEASE"]
            [lein-cloverage              "RELEASE"]
            [lein-kibit                  "RELEASE"]
            [lein-cljfmt                 "RELEASE"]
            [lein-bikeshed               "RELEASE"]
            [codox                       "RELEASE"]
            ]

  :aliases {
            "lint" ["eastwood"]
            "fmt" ["cljfmt", "check"]
            "check" ["kibit"]
            "cover" ["cloverage"]
            "omni" ["do"
                    ["clean"]
                    ;["with-profile" "production" "deps" ":tree"]
                    ;["ancient"] ["kibit"] ["bikeshed"]]
                    ["ancient"] ["kibit"] ["eastwood"]]
            }
  :dependencies [
                 [org.clojure/tools.namespace "RELEASE"]
                 ]
  :injections [
               (require '[clojure.tools.namespace.repl :refer [refresh]])
               ]

  }
 }
