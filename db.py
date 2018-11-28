from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

def singleton(cls):
    instances = {}
    def get_instances():
        if cls not in instances:
            instances[cls] = cls()
        return instances[cls]
    return get_instances

# Association table, code from: https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-viii-followers
friends = db.Table('friends',
    db.Column('friender_id', db.Integer, db.ForeignKey('users.id')),
    db.Column('friended_id', db.Integer, db.ForeignKey('users.id'))
)

class Users(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String, nullable=False)
    username = db.Column(db.String, nullable=False)
    password = db.Column(db.String, nullable=False)
    profile_pic_url = db.Column(db.String, nullable=True)

    followed = db.relationship(
        'Users', secondary=friends,
        primaryjoin=(friends.c.friender_id == id),
        secondaryjoin=(friends.c.friended_id == id),
        backref=db.backref('friends', lazy='dynamic'), lazy='dynamic')


    def __init__(self, **kwargs):
        self.email = kwargs.get('email', '')
        self.username = kwargs.get('username', '')
        self.password = kwargs.get('password', '')
        self.profile_pic_url = kwargs.get('profile_pic_url', None)

    def serialize(self):
        return {
            'id': self.id,
            'email': self.email,
            'username': self.username,
            'password': self.password,
            'profile_pic_url': self.profile_pic_url
        }


class Investments(db.Model):
    __tablename__ = 'investments'
    id = db.Column(db.Integer, primary_key=True)
    users_id = db.Column(db.String, db.ForeignKey('users.id'), nullable=False) #how do I make author the reference to users(id)
    company = db.Column(db.String, nullable=False)
    amount = db.Column(db.Float, nullable=False)
    price = db.Column(db.Float, nullable=False)
    text = db.Column(db.String, nullable=True)
    #method = db.Column(db.String, nullable=True)

    def __init__(self, **kwargs):
        self.company = kwargs.get('company', '')
        self.amount = kwargs.get('amount', '')
        self.price = kwargs.get('price', '')
        self.text = kwargs.get('text', '')
        #self.method = kwargs.get('method', '')

    def serialize(self):
        return {
            'id': self.id,
            'company': self.company,
            'amount': self.amount,
            'price': self.price,
            'text': self.text
            #'method': self.method
        }

class Comments(db.Model):
    __tablename__= 'comments'
    id = db.Column(db.Integer, primary_key=True)
    users_id = db.Column(db.String, db.ForeignKey('users.id'), nullable=False)
    text = db.Column(db.String, nullable=False)
    username = db.Column(db.String, nullable=False)

    def __init__(self, **kwargs):
        self.text = kwargs.get('text', '')
        self.username = kwargs.get('username', '')

    def serialize(self):
        return {
            'id': self.id,
            'text': self.text,
            'username': self.username
        }
