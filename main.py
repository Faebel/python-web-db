import configparser
from flask import Flask, render_template, request
import mysql.connector
from collections.abc import Container
from dotenv import load_dotenv
import os

# Read configuration from file.
load_dotenv()
config = configparser.ConfigParser()
config.read('config.ini')

con = {
    'host' : 'db',
    'user' : os.environ.get('MYSQL_USER'),
    'passwd' : os.environ.get('MYSQL_PASSWORD'),
    'database' : os.environ.get('MYSQL_DATABASE')
}


# Set up application server.
app = Flask(__name__)

# Create a function for fetching data from the database.
def sql_query(sql):
    db = mysql.connector.connect(**con)
    cursor = db.cursor()
    cursor.execute(sql)
    result = cursor.fetchall()
    cursor.close()
    db.close()
    return result


def sql_execute(sql):
    db = mysql.connector.connect(**con)
    cursor = db.cursor()
    cursor.execute(sql)
    db.commit()
    cursor.close()
    db.close()

# For this example you can select a handler function by
# uncommenting one of the @app.route decorators.

#@app.route('/')
def basic_response():
    return "It works!" #example

#@app.route('/')
def template_response():
    return render_template('home.html')

@app.route('/', methods=['GET', 'POST'])
def template_response_with_data():
    print(request.form)
    if "buy-book" in request.form:
        book_id = int(request.form["buy-book"])
        sql = "delete from book where id={book_id}".format(book_id=book_id)
        sql_execute(sql)
    template_data = {}
    sql = "select id, title from book order by title"
    books = sql_query(sql)
    template_data['books'] = books
    return render_template('home-w-data.html', template_data=template_data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
#**config['app']