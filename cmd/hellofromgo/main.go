package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello from Go.")
	})
	http.HandleFunc("/home", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Home sweet home.")
	})
	http.HandleFunc("/shopping", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Enjoy.")
	})
	http.ListenAndServe(":8080", nil)
}
