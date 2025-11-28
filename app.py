
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return '<h1>Hello from Terraform! Infrastructure is Working! 🚀</h1>'

if __name__ == '__main__':
    # 0.0.0.0 means this will accept traffic from the internet
        # Port 80 is the standard port for web traffic
    app.run(host='0.0.0.0', port=80)
