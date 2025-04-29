import os
import json
import logging
import mysql.connector
from flask import Flask, request, jsonify
from mysql.connector import errorcode
from contextlib import closing
import threading

app = Flask(__name__)
logging.basicConfig(level=logging.INFO)

def get_db_connection():
    try:
        conn = mysql.connector.connect(
            user='app',
            password=os.getenv('MYSQL_PASSWORD'),
            host='db',
            port=3306,
            database='app',
            connection_timeout=3
        )
        return conn
    except mysql.connector.Error as err:
        logging.error(f"Database connection failed: {err}")
        return None

@app.route('/api/predict', methods=['POST'])
def predict():
    if request.content_type != 'application/json':
        return "Invalid request 1\n", 400

    try:
        body = request.get_json()
        q = body.get('q')
        max_tokens = body.get('maxTokens')
        if q is None:
            return "Invalid request \n" + str(q) + str(max_tokens), 400
    except Exception as e:
        print(e)
        logging.error(f"Failed to decode json: {e}")
        return "Invalid request 3\n", 400

    conn = get_db_connection()
    if not conn:
        return "Failed to query db\n", 500

    with closing(conn.cursor()) as cursor:
        try:
            query = f"SELECT reply FROM replies WHERE LOWER(prompt) LIKE %s LIMIT 1"
            cursor.execute(query, (f"%{q.lower()}%",))
            row = cursor.fetchone()
            if row:
                reply = row[0]
                # TODO: handle max_tokens param
            else:
                reply = "No such programming language ( "+q+" ) on my database"
        except Exception as e:
            logging.error(f"Failed to query db: {e}")
            return "Failed to query db\n", 500
        finally:
            conn.close()

    return jsonify(reply), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
