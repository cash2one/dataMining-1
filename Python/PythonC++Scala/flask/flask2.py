import logging
logging.basicConfig(level=logging.INFO)

from flask import make_response,jsonify
from flask import abort, redirect
from flask import Flask,request
app=Flask('info_center')
@app.route('/alg')
def alg():
    x=request.args['x']
    y=request.args['y']
    return jsonify({'x':x,'y':y})
if __name__=="__main__":
    port=5701
    logging.info('server http://127.0.0.1:%s/'%port)
    app.run(host='0.0.0.0',port=port,debug=True)    