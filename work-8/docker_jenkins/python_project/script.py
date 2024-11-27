from flask import Flask, jsonify
import json

app = Flask(__name__)

@app.route('/')
def home():
    # Генерация JSON-ответа
    data = {"message": "Hello from Jenkins!", "success": True}
    return jsonify(data)

if __name__ == "__main__":
    # Запускаем сервер Flask на порту 5000
    app.run(host='0.0.0.0', port=5000)
