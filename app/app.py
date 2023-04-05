from flask import Flask, render_template
import os

app = Flask(__name__)
app.config.from_object(os.environ['APP_SETTINGS'])
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False


with open(os.environ['DATABASE_URL'], 'r') as f:
    db_url = f.read().strip()

app.config['SQLALCHEMY_DATABASE_URI'] = db_url#os.environ['DATABASE_URL']
from models import db, Movie
db.init_app(app)


@app.route('/')
def hello():
    movies = Movie.query.all()
    return render_template('index.html', movies=movies)


if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0',port=os.environ['FLASK_RUN_PORT'])
