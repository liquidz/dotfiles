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
            [com.billpiel/sayid "RELEASE"]
            [cider/cider-nrepl  "RELEASE"]
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
