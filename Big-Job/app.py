import os

from flask import Flask, render_template, request
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
    country_df['coal_emission'] = round((country_df['coal']/100*mediane[0]), 2)
    country_df['gas_emission'] = round((country_df['gas']/100*mediane[1]), 2)
    country_df['oil_emission'] = round((country_df['oil']/100*mediane[2]), 2)
    country_df['hydro_emission'] = round((country_df['hydro']/100*mediane[3]), 2)
    country_df['renewable_emission'] = round((country_df['renewable']/100*mediane[4]), 2)
    country_df['nuclear_emission'] = round((country_df['nuclear']/100*mediane[5]), 2)
    country_df['total_emission'] = round((country_df['coal_emission'] + country_df['gas_emission'] + country_df['oil_emission'] + country_df['hydro_emission']
                                    + country_df['renewable_emission'] + country_df['nuclear_emission']),2)
    return country_df

#Émissions annuelles totales de CO2 = Émissions totales en kgCO2/kWh x nombre d'heures dans une année x consommation électrique
@app.route('/emissions', methods=['POST'])
def annual_emissions():
    electricity_consumed = (request.form['countryInput'])
    if electricity_consumed == "":
        return render_template('co2.html', error="Error in your selection: Please select a correct consumption value (in kW)")

    electricity_consumed = float(electricity_consumed)
    selected_country = request.form['countrySelect']

    if selected_country == "all":
        return render_template('co2.html', error= "Error in your selection: Please select a single country")

    df = emission_contributions()
    country_df = df[df["country"] == selected_country]
    emissions = country_df['total_emission'].values[0] / 1000
    year_hours = 24 * 365
    annual_emissions = electricity_consumed * year_hours * emissions
    # tree compensation for the carbon dioxide
    tree_abs = 25
    number_of_trees = annual_emissions / tree_abs

    return render_template('co2.html', result=str(annual_emissions) + str("kg of CO2") , selected_country=selected_country,
                           trees = number_of_trees, error= "Task Completed. You can try another country by going back to emissions.")



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
    country_df = emission_contributions()
    emissions = country_df.to_dict(orient='records')
    return render_template('emissions.html', countries=countries, emissions=emissions)

# all regions table deployment
@app.route('/regions')
def regions():
    regions = get_regions()
    return render_template('regions.html', regions=regions)


if __name__ == '__main__':
    app.run(debug=True)


















