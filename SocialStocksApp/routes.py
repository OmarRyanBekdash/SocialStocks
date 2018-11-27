import json
from db import db, Users
from flask import Flask, request

db_filename = "todo2.db"
app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///%s' % db_filename
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

db.init_app(app)
with app.app_context():
    db.create_all()

@app.route('/api/investments/')
def get_investments ():
    investments = Investments.query.all()
    res = {'success': True, 'data': [investment.serialize() for investment in investments]}
    return json.dumps(res)

@app.route('/api/investments/', methods=['POST'])
def post_investment ():
    body = json.loads(request.data)

    investment = Investments(
        company = body.get('company'),
        amount = body.get('amount'),
        price = body.get('price'),
        text = body.get('text')
    )
    db.session.add(investment)
    db.session.commit()
    return json.dumps({'success': True, 'data': investment.serialize()}), 201


if __name__ = '__main__'
    app.run(host='0.0.0.0', port=6000, debug=True)

