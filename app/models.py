from flask_sqlalchemy import SQLAlchemy
from datetime import date
import random
db = SQLAlchemy()

class Movie(db.Model):
    __tablename__ = 'movie'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String)
    director = db.Column(db.String)
    genre = db.Column(db.String)
    release_date = db.Column(db.Date)
#
# from flask_sqlalchemy import SQLAlchemy
#
# db = SQLAlchemy()
# class Quote(db.Model):
#     __tablename__ = 'quote'
#
#     id = db.Column(db.Integer, primary_key=True)
#     quote = db.Column(db.String(255), unique=True, nullable=False)
#     author = db.Column(db.String(255), nullable=False)
#     created_at = db.Column(db.DateTime, server_default=db.func.now(), nullable=False)
#     updated_at = db.Column(db.DateTime, server_default=db.func.now(), onupdate=db.func.now(), nullable=False)
#
#
#     # def __init__(self, url, result_all, result_no_stop_words):
#     #     self.url = url
#     #     self.result_all = result_all
#     #     self.result_no_stop_words = result_no_stop_words

    # def __repr__(self):
    #     return '<id {}>'.format(self.id)

# app = Flask(__name__)
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# db_host = os.environ.get('DB_HOST', 'db')
# db_port = os.environ.get('DB_PORT', '5432')
# db_user = os.environ.get('DB_USER', 'postgres')
# db_password = os.environ.get('DB_PASSWORD', 'postgres')
# db_name = os.environ.get('DB_NAME', 'postgres')

# app.config['SQLALCHEMY_DATABASE_URI'] = f'postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}'
#
# db = SQLAlchemy(app)
#
# class Quote(db.Model):
