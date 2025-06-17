from flask import Flask, render_template, request, redirect, session
from pymongo import MongoClient

app = Flask(__name__)
app.secret_key = 'supersecretkey'

client = MongoClient('mongodb://localhost:27017/')
db = client['my_first_mongodb_project']
records_col = db['records']

@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        if request.form['username'] == 'admin' and request.form['password'] == 'password':
            session['user'] = 'admin'
            return redirect('/dashboard')
        else:
            return render_template('login.html', error="Invalid credentials")
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('user', None)
    return redirect('/')

@app.route('/dashboard')
def dashboard():
    if 'user' not in session:
        return redirect('/')
    q = request.args.get('q', '')
    if q:
        records = list(records_col.find({
            '$or': [
                {'name': {'$regex': q, '$options': 'i'}},
                {'report_type': {'$regex': q, '$options': 'i'}}
            ]
        }, {'_id': 0}))
    else:
        records = list(records_col.find({}, {'_id': 0}))
    return render_template('dashboard.html', records=records, search=q)

@app.route('/add', methods=['POST'])
def add_record():
    if 'user' not in session:
        return redirect('/')
    data = {
        'name': request.form['name'],
        'age': int(request.form['age']),
        'report_type': request.form['report_type'],
        'date': request.form['date'],
        'notes': request.form['notes']
    }
    records_col.insert_one(data)
    return redirect('/dashboard')

@app.route('/delete/<name>')
def delete_record(name):
    if 'user' not in session:
        return redirect('/')
    records_col.delete_one({'name': name})
    return redirect('/dashboard')

@app.route('/update/<name>', methods=['GET', 'POST'])
def update_record(name):
    if 'user' not in session:
        return redirect('/')
    record = records_col.find_one({'name': name}, {'_id': 0})
    if not record:
        return redirect('/dashboard')
    if request.method == 'POST':
        updated = {
            'name': request.form['name'],
            'age': int(request.form['age']),
            'report_type': request.form['report_type'],
            'date': request.form['date'],
            'notes': request.form['notes']
        }
        records_col.update_one({'name': name}, {'$set': updated})
        return redirect('/dashboard')
    return render_template('update_form.html', record=record)

if __name__ == '__main__':
    app.run(debug=True)
