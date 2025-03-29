package chatter

import (
	"auraluvsu.com/User"
	"auraluvsu.com/Utils"
	"database/sql"
	"fmt"
	"github.com/gorilla/websocket"
	_ "github.com/mattn/go-sqlite3"
	"log"
	"net"
	"net/http"
)

var clients = make(map[*websocket.Conn]bool)

// This struct is created for ease of storing information about each created room
type Chatroom struct {
	ID   []byte
	name string
	port string
}

type Message struct {
	Sender  string `json:"sender"`
	Content string `json:"content"`
}

// Websocket upgrader
var upgrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}

func InitDB() *sql.DB {
	db, err := sql.Open("sqlite3", "./database.db")
	if err != nil {
		log.Fatal("Error conecting to SQLite:", err)
	}

	createTable := `CREATE TABLE IF NOT EXISTS tblUser (
        userid      TEXT PRIMARY KEY,
        username    TEXT NOT NULL UNIQUE,
        password    TEXT NOT NULL,
        created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );`
	_, err = db.Exec(createTable)
	if err != nil {
		log.Fatal("Error creating table:", err)
	}
	fmt.Println("Connected to Database successfully!")
	return db
}

func HandleConnection(w http.ResponseWriter, r *http.Request) {
	var msgChan = make(chan Message)
	db := InitDB()
	ws, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		log.Println("Error upgrading connection:", err)
		return
	}
	defer ws.Close()
	fmt.Println("Websocket connection established!")
	var newUsername string
	var userKey string
	clients[ws] = true
	newUser := user.CreateUser(newUsername, userKey)
	_, err = db.Exec("INSERT INTO tblUser (username) VALUES (?)", string(newUser.Name))
	_, err = db.Exec("INSERT INTO tblUser (password) VALUES (?)", string(newUser.Key))
	go SendMessage(ws, msgChan)
	go ReceiveMessage(ws, msgChan)
	select {}

}

func SendMessage(ws *websocket.Conn, msgChan chan Message) {
	for {
		msg := <-msgChan
		for client := range clients {
			err := client.WriteJSON(msg)
			if err != nil {
				fmt.Println("Write error:", err)
				client.Close()
				delete(clients, client)
			}
		}
	}
}

func ReceiveMessage(ws *websocket.Conn, msgChan chan Message) {
	for {
		var msg Message
		err := ws.ReadJSON(&msg)
		if err != nil {
			fmt.Println("Error reading message:", err)
			delete(clients, ws)
			break
		}
		msgChan <- msg
	}
}

func CreateNewRoom(newName string) Chatroom {
	idBytes, err := utils.RandBytes(8)
	if err != nil {
		log.Fatalf("Error getting custom ID: %v", err)
	}

	newRoom := Chatroom{
		ID:   idBytes,
		name: newName,
	}
	return newRoom
}

func SetConnection(port int16) (net.Conn, error) {
	host := "192.168.0.100"
	address := fmt.Sprintf("%v:%v", host, port)
	conn, err := net.Dial("tcp", address)
	if err != nil {
		return nil, fmt.Errorf("Error connecting to server...")
	}
	fmt.Printf("Connected to server: %v\n", port)
	return conn, nil
}
