FROM python:3.10-slim

RUN apt-get update && apt-get install -y git && apt-get clean

WORKDIR /app

COPY . .

WORKDIR /app/python_project/

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python", "script.py"]
