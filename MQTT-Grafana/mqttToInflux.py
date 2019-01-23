import paho.mqtt.client as mqtt
from influxdb import InfluxDBClient
import datetime
import logging
 
def persists(msg):
    topicTokens = msg.topic.split("/")
    deviceId = topicTokens[0]
    measurement = topicTokens[1]
    current_time = datetime.datetime.utcnow().isoformat()
    json_body = [
        {
            "measurement": measurement,
            "tags": {
                "deviceId" : deviceId
            },
            "time": current_time,
            "fields": {
                "value": float(msg.payload)
            }
        }
    ]
    logging.info(json_body)
    influx_client.write_points(json_body)
    logging.info("success")


 
logging.basicConfig(level=logging.DEBUG)
influx_client = InfluxDBClient('localhost', 8086, database='CoolSwitch')
client = mqtt.Client()

client.on_connect = lambda self, mosq, obj, rc: (self.subscribe("+/state"),
                                                 self.subscribe("+/current"))
client.on_message = lambda client, userdata, msg: persists(msg)
 
client.connect("localhost", 1883, 60)
 
client.loop_forever()
