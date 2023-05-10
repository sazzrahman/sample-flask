from flask import Flask, request, jsonify
from functools import wraps
import os
import subprocess
import sys
import re

app = Flask(__name__)


@app.route("/hello", methods=["GET"])
def start_job():
    db = os.getenv("DB")
    return jsonify({"message": f"HELLO ENV {db}"}), 200


if __name__ == "__main__":
    app.run(debug=bool(int(os.getenv("DEBUG"))))
