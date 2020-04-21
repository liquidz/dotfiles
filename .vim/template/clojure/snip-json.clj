;; [org.clojure/data.json "1.0.0"]
(comment
  (require '[clojure.data.json :as json])
  (json/read-str (json/write-str {:a 1 :b 2}))
  )

