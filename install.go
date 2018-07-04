package main

import (
	"database/sql"
	"fmt"
	_ "github.com/mattn/go-sqlite3"
	"io/ioutil"
	"log"
	"os/exec"
	"strings"
)

func main() {
	db, err := sql.Open("sqlite3", "./macos_install.db")
	if err != nil {
		log.Fatal("Failed to open database:", err)
	}
	defer db.Close()

	q, err := db.Query("select distinct name, category, method from software")
	if err != nil {
		log.Fatalf("Failed to read data from database: %s", err)
	}
	defer q.Close()
	fmt.Println(install(q))
}

func install(methodname *sql.Rows) bool {
	installs := map[string][]string{
		"tap":  {"brew", "tap"},
		"core": {"brew", "install"},
		"cask": {"brew", "cask", "install"},
		"mas":  {"mas", "install"},
		"gem":  {"gem", "install"},
	}

	for methodname.Next() {
		var name string
		var category string
		var method string
		err := methodname.Scan(&name, &category, &method)
		if err != nil {
			log.Fatal(err)
		}
		fmt.Printf("Install package %s, from category %s, with %s\n", name, category, method)
		args := []string{}
		cmds := ""
		for methods, install := range installs {
			if strings.Contains(methods, method) {
				cmds = strings.Join(install[:1], "")
				args = append(install[1:], []string{name}...)
				fmt.Println(cmds, strings.Join(args, " "))
			}
		}

		cmd := exec.Command(cmds, args...)
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
	return true
}
