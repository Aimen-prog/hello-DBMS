import os
from flask import Flask, render_template
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

def get_countries():
    connection = connect_db()
    cursor = connection.cursor(dictionary=True)

    # Assuming your table is named 'Country'
    query = "SELECT * FROM Country"
    cursor.execute(query)

    countries = cursor.fetchall()

    cursor.close()
    connection.close()

    return countries


def get_regions():
    connection = connect_db()
    cursor = connection.cursor(dictionary=True)

    # Assuming your table is named 'Country'
    query = "SELECT * FROM World"
    cursor.execute(query)
    regions = cursor.fetchall()
    cursor.close()
    connection.close()
    return regions


@app.route('/')
def home():
    return render_template('home.html')


# Home page
@app.route('/countries')
def countries():
    countries = get_countries()
    return render_template('countries.html', countries=countries)

@app.route('/regions')
def regions():
    regions = get_regions()
    return render_template('regions.html', regions=regions)




if __name__ == '__main__':
    app.run(debug=True)


















