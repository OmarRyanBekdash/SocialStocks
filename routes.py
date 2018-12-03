import json
from db import db, Users, friends, Investments, Comments
from flask import Flask, request
from stock_api import StockGetter
from sqlalchemy import desc, asc
import datetime

db_filename = "SocialStocksDB"
app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///%s' % db_filename
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

db.init_app(app)
with app.app_context():
    db.create_all()

stockObj = StockGetter()

@app.route('/welcome/')
def welcome_message():
    return json.dumps({'success': True, 'data': 'Welcome!'}), 200

@app.route('/stock_demo/')
def stock_demo():
    return stockObj.get_current_price('MFST')

@app.route('/api/user/', methods=['POST'])
def create_user():
    body = json.loads(request.data)
    correct_user = Users.query.filter_by(username=body.get('username')).first()
    if correct_user == None: 
        user = Users(
            email=body.get('email'),
            username=body.get('username'),
            password=body.get('password'),
            profile_pic_url=body.get('profile_pic_url'),
            privacy=bool(body.get('privacy'))
        )
        db.session.add(user)
        db.session.commit()
        return json.dumps({'success': True, 'data': user.serialize()}), 201
    else:
        correct_user2 = Users.query.filter_by(password=body.get('password')).first()
        if correct_user == correct_user2 and correct_user != None:
            return json.dumps({'success': True, 'data': correct_user.serialize()}), 200
        return json.dumps({'success': False, 'error': 'Password is incorrect. Try again.'}), 404
    return json.dumps({'success': False, 'error': 'Username or Password is not correct. Try again.'}), 404

@app.route('/api/user/<int:user_id>/', methods=['POST', 'GET'])
def user_methods(user_id):
    if request.method == 'POST':
        return update_user(user_id)
    elif request.method == 'GET':
        return get_user(user_id)

def update_user(user_id):
    user = Users.query.filter_by(id=user_id).first()
    if user is not None:
        body = json.loads(request.data)
        for key in body:
            setattr(user, str(key), body.get(key))
        db.session.add(user)
        db.session.commit()
        return json.dumps({'success': True, 'data': user.serialize()})
    return json.dumps({'success': False, 'error': 'User does not exist.'})

def get_user(user_id):
    user = Users.query.filter_by(id=user_id).first()
    if user is not None:
        return json.dumps ({'success': True, 'data': user.serialize()}), 200
    return json.dumps({'success': False, 'error': 'User not found!'}), 404

# def get_user(user_id):
#     user = Users.query.filter_by(id=user_id).first()
#     if user is not None:
#         return json.dumps ({'success': True, 'data': user.serialize()}), 200
#     return json.dumps({'success': False, 'error': 'User not found!'}), 404

def helper(user_id):
    """
    Returns an Python object containing all the investments of a user if the user has privacy
    turned off.
    """
    user = Users.query.filter_by(id=user_id).first()
    if user is not None:
        if user.privacy == False:
            investments = Investments.query.all(user_id=user_id)
            return investments
        if user.privacy == True:
            return []

@app.route('/api/investments/a/<int:user_id>/')
def get_investments_by_user_privacy(user_id):
    user = Users.query.filter_by(id=user_id).first()
    if user is not None:
        if user.privacy == False:
            investments = helper(user_id)
            res = {'success': True, 'data': [investment.serialize() for investment in investments]}
            return json.dumps(res)
        if user.privacy == True:
            res = {'success': True, 'data': []}
            return json.dumps(res)
    return json.dumps({'success': False, 'error': 'User does not exist.'})

@app.route('/api/investments/a/<int:user_id>/final/')
def get_friends_investments_final(user_id):
    user = Users.query.filter_by(id=user_id).first()
    if user is not None:
        friends = user.friended.all()
        acc = []
        for friend_id in friends:
            friends_investments = helper(friend_id) # list of investments
            for investment in friends_investments: # for each investment, append to accumulator
                acc.append(investment)
        res = {'success': True, 'data': acc}
        return json.dumps(res)
    return json.dumps({'success': False, 'error': 'User does not exist.'})

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
    user = Users.query.filter_by(id=user_id)
    if user is not None:
        user_investments = Investments.query.filter_by(users_id=user_id).order_by(desc(Investments.time)).all()
        if user_investments is not None:
            return json.dumps({'success': True, 'data': [inv.serialize() for inv in user_investments]}), 200
        return json.dumps({'success': False, 'error': 'User has no investments!'})
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

# See investments of all of user's friends
@app.route('/api/investments/friend/<int:user_id>/')
def get_friends_investments(user_id):
    user = Users.query.filter_by(id=user_id).first()
    if user is not None:
        friends = user.friended.all()
        investments = []
        for friend in friends: 
            invs = Investments.query.filter_by(users_id=friend.id).all()
            for inv in invs:
                investments.append(inv)
        return json.dumps({'success': True, 'data': [inv.serialize() for inv in investments]}), 201
    return json.dumps({"success": False, 'error': "User not found"})

 
# Makes a friend relationship: <user_id> --> <friend_id>
@app.route('/api/friend/<int:user_id>/<int:friend_id>/', methods=['POST'])
def make_friend(user_id, friend_id):
    user = Users.query.filter_by(id=user_id).first()
    f = Users.query.filter_by(id=friend_id).first()
    if user is not None and f is not None:
        user.friend(f)
        f.friend(user)
        db.session.add(user)
        db.session.add(f)
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


# Return the current price of a stock
@app.route('/api/stock/<string:symbol>/', methods=["GET"])
def get_price(symbol):
    return stockObj.get_quote(symbol)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
