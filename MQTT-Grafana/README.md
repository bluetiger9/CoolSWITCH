<img src="https://github.com/bluetiger9/CoolSWITCH/raw/master/MQTT-Grafana/CoolSWITCH-grafana.png">

**docker-compose.yml**
 - run Mosquitto, InfluxDB and Grafana

**mqttToInflux.py**
 - listens for MQTT message sent by CoolSWITCH-s, and inserts the data into the InfluxDB

**CoolSWITCH-Grafana-Dashboard.json**
 - grafana Dashboard JSON Model

**Based on**:
https://gonzalo123.com/2018/06/04/playing-with-docker-mqtt-grafana-influxdb-python-and-arduino/
