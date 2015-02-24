{:user
 {:plugins [
            [lein-ancient "0.6.2"]
            [jonase/eastwood "0.2.1"]
            [lein-cloverage "1.0.2"]
            [lein-kibit "0.0.8"]
            [lein-cljfmt "0.1.5"]
            [lein-bikeshed "0.2.0"]
            [codox "0.8.10"]
            ]

  :aliases {
            "lint" ["eastwood"]
            "check" ["kibit"]
            "cover" ["cloverage"]
            "omni" ["do"
                    ["clean"]
                    ;["with-profile" "production" "deps" ":tree"]
                    ["ancient"] ["kibit"] ["bikeshed"]]
            }
  }}
