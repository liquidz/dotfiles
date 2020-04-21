(t/deftest {{_input_:var}}-test
  {{_cursor_}}(t/testing "事前確認"
    (t/is false))

  (t/is false)

  (t/testing "事後確認"
    (t/is false))
  )
