from flask import Flask,jsonify
app=Flask(__name__)
@app.route('/put')
def put():
    dictkey={'a':1,'b':2}
    return jsonify(dictkey)
if __name__=='__main__':
    app.run()
