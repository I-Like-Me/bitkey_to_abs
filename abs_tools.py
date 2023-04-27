import config as Config
import time
import requests
import json
from authlib.jose import JsonWebSignature

class Abs_Actions:
    def get_all():
        token_id = Config.Config.ABS_API_KEY
        token_secret = Config.Config.ABS_API_SECRET
        request = {
            "method": "GET",
            "contentType": "application/json",
            "uri": "/v3/reporting/devices",
            "queryString": "pageSize=500",
            "payload": {}
        }
        request_payload_data = {
            "data": request["payload"]
        }
        headers = {
            "alg": "HS256",
            "kid": token_id,
            "method": request["method"],
            "content-type": request["contentType"],
            "uri": request["uri"],
            "query-string": request["queryString"],
            "issuedAt": round(time.time() * 1000)
        }
        jws = JsonWebSignature()
        signed = jws.serialize_compact(headers, json.dumps(request_payload_data), token_secret)
        request_url = "https://api.absolute.com/jws/validate"
        r = requests.post(request_url, signed, {"content-type": "text/plain"})
        r_json = r.json()
        return r_json