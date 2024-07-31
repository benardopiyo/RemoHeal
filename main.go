package main

import (
	"log"
	"net/http"
)

func main() {
	// Serve static files from the "assets" directory
	fs := http.FileServer(http.Dir("assets"))
	http.Handle("/assets/", http.StripPrefix("/assets/", fs))

	// Serve the HTML files
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Path == "/" {
			http.ServeFile(w, r, "templates/index.html")
			return
		}
		if r.URL.Path == "/about" {
			http.ServeFile(w, r, "templates/about.html")
			return
		}
		if r.URL.Path == "/chps" {
			http.ServeFile(w, r, "templates/chps.html")
			return
		}
		if r.URL.Path == "/smartwear" {
			http.ServeFile(w, r, "templates/smartwear.html")
			return
		}
		if r.URL.Path == "/doctor" {
			http.ServeFile(w, r, "templates/doctor.html")
			return
		}
		if r.URL.Path == "/department" {
			http.ServeFile(w, r, "templates/department.html")
			return
		}
		if r.URL.Path == "/contact" {
			http.ServeFile(w, r, "templates/contact.html")
			return
		}
		if r.URL.Path == "/docsresponse" {
			http.ServeFile(w, r, "templates/docsresponse.html")
			return
		}
		if r.URL.Path == "/doctorslogin" {
			http.ServeFile(w, r, "templates/doctorslogin.html")
			return
		}
		if r.URL.Path == "/patientpresc" {
			http.ServeFile(w, r, "templates/patientpresc.html")
			return
		}
		if r.URL.Path == "/patientsignin" {
			http.ServeFile(w, r, "templates/patientsignin.html")
			return
		}
		if r.URL.Path == "/patientsignup" {
			http.ServeFile(w, r, "templates/patientsignup.html")
			return
		}
		http.NotFound(w, r)
	})

	// Start the server
	log.Println("Server running on http://localhost:8000")
	if err := http.ListenAndServe(":8000", nil); err != nil {
		log.Fatal(err)
	}
}
