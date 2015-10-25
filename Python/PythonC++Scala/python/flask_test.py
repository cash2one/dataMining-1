from flask import render_template
from flask import Flask  
app = Flask(__name__)
@app.route('/')
def hell_world():
	return "hello world"
if __name__=='__main__':
	app.run()

