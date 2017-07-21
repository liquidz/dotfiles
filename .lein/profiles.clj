{:user
 {:plugins [
            [lein-ancient       "RELEASE"]
            [jonase/eastwood    "RELEASE"]
            [lein-cloverage     "RELEASE"]
            [lein-kibit         "RELEASE"]
            [lein-cljfmt        "RELEASE"]
            [lein-bikeshed      "RELEASE"]
            [codox              "RELEASE"]
            [refactor-nrepl     "RELEASE"]
            [com.billpiel/sayid "0.0.15"]
            ; sayid 0.0.15 が cider-nrepl 0.14.0 に依存
            [cider/cider-nrepl  "0.14.0"]
            ]

  :aliases {
            "lint"  ["eastwood"]
            "fmt"   ["cljfmt", "check"]
            "check" ["kibit"]
            "cover" ["cloverage"]
            "omni"  ["do" ["clean"] ["ancient"] ["kibit"] ["eastwood"]]
            }

  :dependencies [
                 [org.clojure/tools.namespace "RELEASE"]
                 [com.cemerick/pomegranate    "RELEASE"]
                 [com.taoensso/tufte          "RELEASE"]
                 ]

  :injections [
               (require '[clojure.tools.namespace.repl :refer [refresh]])
               (require 'cemerick.pomegranate)
               (defmacro add-dep [pkg]
                 `(cemerick.pomegranate/add-dependencies
                   :coordinates '[[~pkg "RELEASE"]]
                   :repositories (merge cemerick.pomegranate.aether/maven-central
                                        {"clojars" "https://clojars.org/repo"})))
               (defmacro start-figwheel []
                 `(do (require 'figwheel-sidecar.repl-api)
                      (figwheel-sidecar.repl-api/start-figwheel!)))
               ]
  }}
