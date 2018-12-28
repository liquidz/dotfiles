(ns __dummy__.core
  (:require [clojure.tools.cli :as cli])
  (:gen-class))

(def ^:private cli-options
  [["-h" "--help"]])

(defn greet [msg]
  (str "hello " msg))

(defn -main [& args]
  (let [{:keys [arguments options summary errors]} (cli/parse-opts args cli-options)]
    (cond
      errors (doseq [e errors] (println e))
      (:help options) (println (str "Usage:\n" summary))
      :else (println (greet arguments)))))

