import http.server
import socketserver

# Эта переменная нужна для обработки запросов клиента к серверу.
handler = http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(("", 1234), handler) as httpd:
    httpd.serve_forever()
