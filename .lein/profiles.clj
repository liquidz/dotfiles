{:user
 {;:plugins [
  ;          ;[lein-ancient       "RELEASE"]
  ;          ;[jonase/eastwood    "RELEASE"]
  ;          ;[lein-cloverage     "RELEASE"]
  ;          ;[lein-kibit         "RELEASE"]
  ;          ;[lein-cljfmt        "RELEASE"]
  ;          ;[lein-bikeshed      "RELEASE"]
  ;          ;[codox              "RELEASE"]

  ;          [cider/cider-nrepl "0.16.0-SNAPSHOT"]
  ;          [refactor-nrepl "2.4.0-SNAPSHOT"]
  ;          ]

  ;:aliases {
  ;          ;"lint"  ["eastwood"]
  ;          "fmt"   ["cljfmt", "check"]
  ;          "check" ["kibit"]
  ;          "cover" ["cloverage"]
  ;          "omni"  ["do" ["clean"] ["ancient"] ["kibit"] ["eastwood"]]
  ;          }

  ;:dependencies [
  ;               [org.clojure/tools.namespace "RELEASE"]
  ;               [org.clojure/tools.trace     "0.7.9"]
  ;               [com.cemerick/pomegranate    "RELEASE"]
  ;               [alembic                     "0.3.2"]
  ;               [com.taoensso/tufte          "RELEASE"]
  ;               [jonase/eastwood             "0.2.4" :exclusions [org.clojure/clojure]]
  ;               [eftest                      "0.3.1"]
  ;               ]

  ;:injections [
  ;             (require '[clojure.tools.namespace.repl :refer [refresh]])
  ;             (require '[alembic.still :refer [load-project]])
  ;             (defmacro my-add-dep [pkg]
  ;               `(do (require 'cemerick.pomegranate)
  ;                    (cemerick.pomegranate/add-dependencies
  ;                      :coordinates '[[~pkg "RELEASE"]]
  ;                      :repositories (merge cemerick.pomegranate.aether/maven-central
  ;                                           {"clojars" "https://clojars.org/repo"}))))
  ;             (defmacro my-start-figwheel []
  ;               `(do (require 'figwheel-sidecar.repl-api)
  ;                    (figwheel-sidecar.repl-api/start-figwheel!)))
  ;             ]
  ;
  }}
