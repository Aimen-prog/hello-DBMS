import os
from flask import Flask
import mysql.connector


app = Flask(__name__)


def connect_db():
    host = 'localhost'
    user = 'aimen'
    database = 'CarbonFootprint'
    password = os.environ.get('DB_PASSWORD')

    connection = mysql.connector.connect(
        host=host,
        user=user,
        database=database,
        password=password
    )

    return connection

@app.route('/')
def hello():
    return 'Hello, World!'


if __name__ == '__main__':
    connection = connect_db()
    app.run(debug=True)
