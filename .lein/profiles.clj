{:user
 {:plugins []
  :dependencies [[com.github.liquidz/antq "RELEASE"]]
  :aliases {"outdated" ["run" "-m" "antq.core"]}

  ;; :dependencies [[lambdaisland/kaocha "1.0.681"]]
  ;;
  ;; :aliases {"antq" ["run" "-m" "antq.core"]
  ;;           "kaocha" ["run" "-m" "kaocha.runner"]}

  ;; :signing {:gpg-passphrase :env/gpgpass}
  :repl-options {:timeout 3600000}}}
