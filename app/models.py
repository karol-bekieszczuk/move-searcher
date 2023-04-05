from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Movie(db.Model):
    __tablename__ = 'movie'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String)
    director = db.Column(db.String)
    genre = db.Column(db.String)
    description = db.Column(db.String)
    release_date = db.Column(db.Date)
