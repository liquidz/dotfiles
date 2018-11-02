(ns __dummy__.core-test
  (:require [clojure.test :as t]
            [__dummy__.core :as sut]))

(t/deftest greet-test
  (t/is (= (sut/greet "world") "hello world")))
