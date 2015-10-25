import socket
socket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
socket.bind(('127.0.0.1',8002))
socket.listen(5)
while True:
    connection,addr = socket.accept()
    buf=connection.recv(1024)
    connection.send("You give me")
    connection.close()