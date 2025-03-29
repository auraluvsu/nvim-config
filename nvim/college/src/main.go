package main

import (
	"net/http"
)

func main() {
	fs := http.FileServer(http.Dir("../root/templates"))
	http.Handle("/", fs)

	http.ListenAndServe(":010107", nil)
}
