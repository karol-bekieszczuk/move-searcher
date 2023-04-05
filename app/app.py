from flask import Flask, render_template, jsonify, request, url_for
import os
from sqlalchemy import or_, func



from models import db, Movie
app = Flask(__name__)
app.config.from_object(os.environ['APP_SETTINGS'])
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

with open(os.environ['DATABASE_URL'], 'r') as f:
    db_url = f.read().strip()

app.config['SQLALCHEMY_DATABASE_URI'] = db_url
db.init_app(app)


@app.route('/')
def index():
    movies = Movie.query.all()
    return render_template('index.html', movies=movies)

@app.route('/search')
def search():
    query = request.args.get('query')
    results = Movie.query.filter(or_(Movie.title.ilike(f'%{query}%'),
                                     Movie.director.ilike(f'%{query}%'))
                                 ).all()
    return jsonify([{'id': r.id, 'title': r.title, 'director': r.director} for r in results])

@app.route('/<int:movie_id>')
def details(movie_id):
    movie = Movie.query.get(movie_id)
    return render_template('details.html', movie=movie)


if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0',port=os.environ['FLASK_RUN_PORT'])
