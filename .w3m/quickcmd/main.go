package main

import (
	"errors"
	"fmt"
	"net/url"
	"os"
	"strings"
)

func parse(cmd string) (string, error) {
	switch cmd {
	case "g":
		return "https://www.google.co.jp/search?q=%v", nil
	case "d":
		return "https://duckduckgo.com?q=%v", nil
	case "w":
		return "http://ejje.weblio.jp/content_find?query=%v&x=0&y=0", nil
	}
	return "", errors.New("unknown command")
}

func tab_goto(url string) {
	fmt.Println("Content-type: text/plain")
	fmt.Println("W3m-control: PREV")
	fmt.Println("W3m-control: TAB_GOTO", url)
	fmt.Println("")
}

func plain_text(msg string) {
	fmt.Println("Content-type: text/plain")
	fmt.Println("")
	fmt.Println(msg)
}

func main() {
	qs := os.Getenv("QUERY_STRING")
	query_string, err := url.QueryUnescape(qs)
	if err != nil {
		plain_text(fmt.Sprintf("failed to url decode: [%v]", qs))
	}

	arr := strings.SplitN(query_string, " ", 2)
	if len(arr) == 1 {
		plain_text(fmt.Sprintf("invalid query: [%v]", qs))
	} else {
		cmd := strings.TrimSpace(arr[0])
		query := strings.TrimSpace(arr[1])
		format, err := parse(cmd)
		if err != nil {
			plain_text(err.Error())
		} else {
			tab_goto(fmt.Sprintf(format, query))
		}
	}
}
