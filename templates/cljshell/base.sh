#!/usr/bin/env bash
#_(
cat "$0" | clojure -Sdeps '
{:deps {clj-time {:mvn/version "0.14.2"}}}
' -
exit $?
#_nil)

(println "hello")

(require '[clj-time.core :as t])

(println (str (t/now)))
