#!/usr/bin/env bb
(ns newsboat-bookmark
  (:require
    [babashka.curl :as curl]
    [cheshire.core :as json]
    [clojure.string :as str]))

(defn- add-to-raindrop
  [access-token url title]
  (let [resp (curl/post "https://api.raindrop.io/rest/v1/raindrop"
                        {:headers {"Authorization" (str "Bearer " access-token)
                                   "Content-Type" "application/json"}
                         :body (json/encode {:title title
                                             :link url})})]
    (= 200 (:status resp))))

;; (defn- add-to-instapaper
;;   [user-name password url title]
;;   (let [resp (curl/get "https://www.instapaper.com/api/add"
;;                        {:basic-auth [user-name password]
;;                         :query-params {"url" url "title" title}})]
;;     (= 201 (:status resp))))

;; (defn- add-to-local-file
;;   [url file]
;;   (spit file (str url "\n") :append true))

(when (< (count *command-line-args*) 2)
  (println "Invalid request")
  (System/exit 1))

(let [[url title] *command-line-args*
      access-token (System/getenv "RAINDROP_ACCESS_TOKEN")]
  (when-not (and (seq access-token)
                 (add-to-raindrop access-token url title))
    (println "Failed to add")
    (System/exit 1)))

;; (let [[url _title] *command-line-args*
;;       home (System/getenv "HOME")
;;       bookmark-file (str/join File/separator [home ".newsboat" "bookmarks.txt"])]
;;   (add-to-local-file url bookmark-file))
;; (System/exit 0)
