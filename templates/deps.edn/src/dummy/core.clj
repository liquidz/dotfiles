(ns __dummy__.core
  (:gen-class))

(defn greet [msg]
  (str "hello " msg))

(defn -main []
  (println (greet "world")))
