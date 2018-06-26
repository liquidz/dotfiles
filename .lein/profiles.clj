{:user
 {
  :plugins [[lein-ancient "0.6.15"]
  ;          ;[jonase/eastwood    "RELEASE"]
  ;          ;[lein-cloverage     "RELEASE"]
  ;          ;[lein-kibit         "RELEASE"]
  ;          ;[lein-cljfmt        "RELEASE"]
  ;          ;[lein-bikeshed      "RELEASE"]
             [lein-codox         "0.10.4"]

            ;[cider/cider-nrepl "0.16.0-SNAPSHOT"]
            ;[refactor-nrepl "2.4.0-SNAPSHOT"]
            ]

  ;:aliases {
  ;          ;"lint"  ["eastwood"]
  ;          "fmt"   ["cljfmt", "check"]
  ;          "check" ["kibit"]
  ;          "cover" ["cloverage"]
  ;          "omni"  ["do" ["clean"] ["ancient"] ["kibit"] ["eastwood"]]
  ;          }

  :dependencies [
                 ;;[cljfmt "0.5.7"]
                 ; [org.clojure/tools.namespace "RELEASE"]
                 ; [org.clojure/tools.trace     "0.7.9"]
                 ; [com.cemerick/pomegranate    "RELEASE"]
                 ; [alembic                     "0.3.2"]
                 ; [com.taoensso/tufte          "RELEASE"]
                 ; [jonase/eastwood             "0.2.4" :exclusions [org.clojure/clojure]]
                 ; [eftest                      "0.3.1"]
                 ; [compliment "0.3.6"]
                 ]


  :signing {:gpg-key "A7FD4FFE"}
  }}
