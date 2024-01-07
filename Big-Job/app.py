import os
from flask import Flask, render_template
import mysql.connector
import pandas as pd

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

# select all table of countries and emissions
def get_countries():
    connection = connect_db()
    cursor = connection.cursor(dictionary=True)
    query = "SELECT * FROM Country"
    cursor.execute(query)

    countries = cursor.fetchall()

    cursor.close()
    connection.close()

    return countries

# Contribution de X aux émissions totales de CO2 d’un pays = Pourcentage d’utilisation de X du pays x Emission de gCO2 par kWh de X
def emission_contributions():
    countries_data = get_countries()
    country_df = pd.DataFrame(countries_data)
    emission_df = pd.read_csv("carbon_dioxide_emissions.csv", sep=';',  encoding='ISO-8859-1')
    mediane = emission_df['Médiane de gC02/kWh']
    country_df['coal_emission'] = round((country_df['coal']*mediane[0]), 3)
    country_df['gas_emission'] = round((country_df['gas']*mediane[1]), 3)
    country_df['oil_emission'] = round((country_df['oil']*mediane[2]), 3)
    country_df['hydro_emission'] = round((country_df['hydro']*mediane[3]), 3)
    country_df['renewable_emission'] = round((country_df['renewable']*mediane[4]), 3)
    country_df['nuclear_emission'] = round((country_df['nuclear']*mediane[5]), 3)
    pd.set_option('display.max_columns', None)
    emissions = country_df.to_dict(orient='records')
    return emissions


# select all table of regions and emissions
def get_regions():
    connection = connect_db()
    cursor = connection.cursor(dictionary=True)
    query = "SELECT * FROM World"
    cursor.execute(query)
    regions = cursor.fetchall()
    cursor.close()
    connection.close()
    return regions



# write observations (question 3) on home page
def get_observations():
    with open('observations.txt', 'r', encoding='utf-8') as f:
        obs = f.read()
        return obs.split('\n')

# home page deployment
@app.route('/')
def home():
    return render_template('home.html', obs=get_observations())


# all countries' table deployment
@app.route('/countries')
def countries():
    countries = get_countries()
    return render_template('countries.html', countries=countries)

# co2 emissions
@app.route('/emissions')
def emissions():
    countries = get_countries()
    emissions = emission_contributions()
    return render_template('emissions.html', countries=countries, emissions=emissions)

# all regions table deployment
@app.route('/regions')
def regions():
    regions = get_regions()
    return render_template('regions.html', regions=regions)


if __name__ == '__main__':
    app.run(debug=True)


















