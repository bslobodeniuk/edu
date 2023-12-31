from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Glory to Ukraine!', 200

@app.route('/ping/')
def ping():
    return 'OK', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)

