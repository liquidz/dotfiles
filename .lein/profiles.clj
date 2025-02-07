{:user
 {:plugins []
  ;; :dependencies [[com.github.liquidz/antq "RELEASE"]]
  ;; :aliases {"outdated" ["run" "-m" "antq.core"]}

  ;; :dependencies [[lambdaisland/kaocha "1.0.681"]]
  ;;
  ;; :aliases {"antq" ["run" "-m" "antq.core"]
  ;;           "kaocha" ["run" "-m" "kaocha.runner"]}

  :repositories [["maven-snapshots" {:url "https://localhost:8443/repository/maven-snapshots/"
                                     :creds :gpg}]
                 ["maven-releases" {:url "https://localhost:8443/repository/maven-releases/"
                                    :creds :gpg}]
                 ["github" {:url "https://maven.pkg.github.com/liquidz/test"
                            :creds :gpg}]

                 ["clojars" {:url "https://clojars.org/repo"
                             :sign-releases false}]]

  ;; :signing {:gpg-passphrase :env/gpgpass}
  :repl-options {:timeout 3600000}}}
