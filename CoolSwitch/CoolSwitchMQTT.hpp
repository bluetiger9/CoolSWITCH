#include "CoolSwitch.hpp"
#include <Arduino.h>
#include <PubSubClient.h>

#ifndef COOL_SWITCH_MQTT_H
#define COOL_SWITCH_MQTT_H

void mqttCallback(char* topic, byte* payload, unsigned int length) {
}

class CoolSwitchMQTT {
public:
  CoolSwitchMQTT(CoolSwitch& coolSwitch, CoolSwitchConfig& config) 
    : coolSwitch(coolSwitch), coolSwitchConfig(config) {

  }

  void begin() {
    client = PubSubClient(espClient);
    
    mqttServer = coolSwitchConfig.mqttServer;
    mqttPort = coolSwitchConfig.mqttPort.toInt();
    
    if (mqttServer != "") {
      Serial.print("Connecting to MQTT server...");
      
      char mqttServerC[64];
      mqttServer.toCharArray(mqttServerC, 64);
    
      client.setServer(mqttServerC, mqttPort);    
      client.setCallback(mqttCallback);

      char clientName[64];
      coolSwitch.deviceName.toCharArray(clientName, 64);
      
      if (client.connect(clientName)) {
        Serial.println("connected");   
        connected = true;
        
      } else {
        Serial.print("failed with state ");
        Serial.print(client.state());
        delay(2000);
      }
 
    }
  }

  void mqttSend(String topic, String value)
  {
    Serial.println("mqtt send: ");
    Serial.println(topic);
    Serial.println(value);
    client.publish((char*) topic.c_str(), (char*) value.c_str());
  }
  
  void handle() {
    if (connected && (millis() - lastSend > 3000)) {        
        lastSend = millis();
        mqttSend(coolSwitch.deviceName + "/state", (String) coolSwitch.state);
        mqttSend(coolSwitch.deviceName + "/current", String(coolSwitch.currentSensor.getCurrentValue()));        
    }
  };

private:
  CoolSwitch& coolSwitch;
  CoolSwitchConfig& coolSwitchConfig;
  
  WiFiClient espClient;
  PubSubClient client;

  String mqttServer = "";
  int mqttPort = 1883;

  bool connected = false;

  long lastSend = -1;
};
#endif
