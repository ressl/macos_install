package main

import (
	"database/sql"
	"fmt"
	_ "github.com/mattn/go-sqlite3"
	"io/ioutil"
	"log"
	"os/exec"
)

func main() {
	db, err := sql.Open("sqlite3", "./macos_install.db")
	if err != nil {
		log.Fatal("Failed to open database:", err)
	}
	defer db.Close()

	q, err := db.Query("select name, category, method from software")
	if err != nil {
		log.Fatalf("Failed to read data from database: %s", err)
	}
	defer q.Close()
	fmt.Println(install(q))
}

func install(method_name *sql.Rows) string {
	out := ""
	for method_name.Next() {
		var name string
		var category string
		var method string
		err := method_name.Scan(&name, &category, &method)
		if err != nil {
			log.Fatal(err)
		}
		fmt.Printf("Install package %s, from category %s, with %s\n", name, category, method)
		out += fmt.Sprintf("Install package %s, from category %s, with %s\n", name, category, method)
		cmd := exec.Command("brew", "install", name)
		stderr, err := cmd.StderrPipe()
		if err != nil {
			log.Fatalf("Failed to install %s: %s", name, err)
		}
		stdout, err := cmd.StdoutPipe()
		if err != nil {
			log.Fatalf("Failed to install %s: %s", name, err)
		}

		if err := cmd.Start(); err != nil {
			log.Fatalf("Failed to install %s: %s", name, err)
		}
		stdoutp, _ := ioutil.ReadAll(stdout)
		fmt.Printf("%s\n", stdoutp)
		stderrp, _ := ioutil.ReadAll(stderr)
		fmt.Printf("%s\n", stderrp)

		if err := cmd.Wait(); err != nil {
			log.Fatalf("Failed to install %s: %s", name, err)
		}
	}
	return out
}
