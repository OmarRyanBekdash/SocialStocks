import json
from db import db, Users, friends, Investments, Comments
from flask import Flask, request

db_filename = "SocialStocksDB"
app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///%s' % db_filename
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

db.init_app(app)
with app.app_context():
    db.create_all()

@app.route('/welcome/')
def welcome_message():
    return json.dumps({'success': True, 'data': 'Welcome!'}), 200

@app.route('/api/user/', methods=['POST'])
def create_user():
    body = json.loads(request.data)
    user = Users(
        email=body.get('email'),
        username=body.get('username'),
        password=body.get('password')
    )
    db.session.add(user)
    db.session.commit()
    return json.dumps({'success': True, 'data': user.serialize()}), 201


@app.route('/api/users/', methods=["GET"])
def get_users():
    users = Users.query.all()
    res = {'success': True, 'data': [user.serialize() for user in users]}
    return json.dumps(res)

@app.route('/api/investments/')
def get_investments():
    investments = Investments.query.all()
    res = {'success': True, 'data': [investment.serialize() for investment in investments]}
    return json.dumps(res)

@app.route('/api/investments/<int:user_id>/', methods=['POST'])
def post_investment(user_id):
    user = Users.query.filter_by(id=user_id).first()
    if user is not None:
        body = json.loads(request.data)
        investment = Investments(
        company = body.get('company'),
        amount = body.get('amount'),
        price = body.get('price'),
        text = body.get('text'),
        user_id=user.id
        )
        user.investments.append(investment)
        db.session.add(investment)
        db.session.commit()
        return json.dumps({'success': True, 'data': investment.serialize()}), 201
    return json.dumps({'success': False, 'error': 'User not found!'}), 404

@app.route('/api/investments/<int:user_id>/')
def get_user_investments(user_id):
    user_investments = Investments.query.filter_by(users_id=user_id).first()
    if user_investments is not None:
        return json.dumps({'success': True, 'data': user_investments.serialize()}), 200
    return json.dumps({'success': False, 'error': 'User not found!'}), 404
  
@app.route('/api/investment/<int:user_id>/<int:investment_id>/', methods=['DELETE'])
def delete_user_investment(user_id, investment_id):
    user = Users.query.filter_by(id=user_id).first()
    if user is not None:
        investment = Investments.query.filter_by(id=investment_id).first()
        if investment is not None:
            db.session.delete(investment)
            db.session.commit()
            return json.dumps({'success': True, 'data': investment.serialize()}), 200
        return json.dumps({'success': False, 'error': 'Investment post not found!'}), 404
    return json.dumps({'success': False, 'error': 'User not found!'}), 404

#make function to see investments with friend id
#'/api/investments/<int:user_id>/<int:friend_id>/

  
# Makes a friend relationship: <user_id> --> <friend_id>
@app.route('/api/friend/<int:user_id>/<int:friend_id>/', methods=['POST'])
def make_friend(user_id, friend_id):
    user = Users.query.filter_by(id=user_id).first()
    f = Users.query.filter_by(id=friend_id).first()
    if user is not None and f is not None:
        user.friend(f)
        db.session.add()
        db.session.commit()
        return json.dumps({'success': True, 'data': 'friended!'}), 201
    return json.dumps({'success': False, 'error': 'User or friend not found!'}), 404

# Return a list of a user's friends in json format
@app.route('/api/<int:user_id>/friends/', methods=["GET"])
def get_friends(user_id):
    user = Users.query.filter_by(id=user_id).first()
    if user is not None:
        friends = user.friended.all()
        return json.dumps({'success': True, 'data': [friend.serialize() for friend in friends]}), 201
    return json.dumps({'success': False, 'error': 'User not found'}), 404


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
