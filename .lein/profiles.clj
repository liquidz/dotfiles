{:user
 {
  :plugins [
            [lein-ancient "0.6.15"]
            [lein-codox "0.10.4"]
            [lein-pprint "1.2.0"]
            ]
  :signing {:gpg-passphrase :env/gpgpass}
  :repl-options {:timeout 3600000}
  }}
