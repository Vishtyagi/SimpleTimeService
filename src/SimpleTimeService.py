from flask import Flask, request, jsonify
from datetime import datetime, timezone

app = Flask(__name__)

@app.route('/SimpleTimeService', methods=['GET'])
def GetTimeAndIp():

    current_time = datetime.now(timezone.utc).isoformat()

    if request.headers.getlist("X-Forwarded-For"):
        ip = request.headers.getlist("X-Forwarded-For")[0]
    else:
        ip = request.remote_addr

    return jsonify({
        "timestamp": current_time,
        "ip": ip
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
