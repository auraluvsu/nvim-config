from flask import Flask
from flask_socketio import SocketIO, send

app = Flask(__name__)
socketio = SocketIO(app)

@socketio.on('message')
def handle_message(message):
    print(f"Received: {message}")
    send(f"Echo: {message}")

if __name__ == "__main__":
    socketio.run(app, host="localhost", port=5000)
