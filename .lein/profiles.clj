{:user
 {:plugins [
            [lein-ancient      "RELEASE"]
            [jonase/eastwood   "RELEASE"]
            [lein-cloverage    "RELEASE"]
            [lein-kibit        "RELEASE"]
            [lein-cljfmt       "RELEASE"]
            [lein-bikeshed     "RELEASE"]
            [codox             "RELEASE"]
            [lein-swank        "RELEASE"]
            [refactor-nrepl    "RELEASE"]
            [cider/cider-nrepl "RELEASE"]
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
               ]
  }}
