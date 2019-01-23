#include "CoolSwitch.hpp"
#include "CoolSwitchConfig.hpp"
#include <Arduino.h>

#ifndef COOL_SWITCH_HTTP_H
#define COOL_SWITCH_HTTP_H

class CoolSwitchHTTP {
public:
  const uint8_t LED = 2;
  
  CoolSwitchHTTP(CoolSwitch& coolSwitch, CoolSwitchConfig& config) 
    : coolSwitch(coolSwitch), config(config), server(80) {
      
    this->server.on("/", [this]() {      
      digitalWrite(LED, 1);
      this->server.send(200, "text/plain", "Hello from " + this->coolSwitch.deviceName);
      digitalWrite(LED, 0);  
    });
  
    this->server.on("/inline", [this](){
      this->server.send(200, "text/plain", "this works as well");
    });
  
    this->server.on("/state", [this]() {
      this->server.send(200, "text/plain", String() + this->coolSwitch.getState());
    });
  
    this->server.on("/setValue", [this](){
      String message;
      for (int i = 0; i < this->server.args(); i++) {
        String value = this->server.arg(i);
        if (this->server.argName(i) == "wifiSSID") {
          this->config.wifiSSID = value;
                                            
        } else if (this->server.argName(i) == "wifiPassword") {
          this->config.wifiPassword = value;
          
        } else if (this->server.argName(i) == "mqttServer") {
          this->config.mqttServer = value;

        } else if (this->server.argName(i) == "mqttPort") {
          this->config.mqttPort = value;
        
        } else if (this->server.argName(i) == "speed") {
          this->coolSwitch.setSpeed(value.toFloat());
          
        } else if (this->server.argName(i) == "currentLimit") {
          this->coolSwitch.setCurrentLimit(value.toFloat());
          
        } else if (this->server.argName(i) == "softStartStop") {
          this->coolSwitch.enableSoftStartStop(value == "true" ? true : false);
          
        } else if (this->server.argName(i) == "softSwitchDuration") {
          this->coolSwitch.setSoftSwitchingDuration(value.toInt());
        }       
      } 
    
      if (message.length() == 0) {
          this->config.save();
          this->server.send(200, "text/plain", "ok");
      } else {    
          this->server.send(204, "text/plain", message);
      }
    });
  
    this->server.on("/turnOff", [this]() {      
      this->coolSwitch.turnOff();
      this->server.send(200, "text/plain", "Ok");
    });
  
    this->server.on("/turnOn", [this]() {
      this->coolSwitch.turnOn();
      this->server.send(200, "text/plain", "Ok");
    });

    this->server.on("/current", [this]() {
      String message;
      message += this->coolSwitch.currentSensor.getCurrentValue();
      this->server.send(200, "text/plain", message);
    });
    this->server.onNotFound([this]() {
      digitalWrite(LED, 1);
      String message = "File Not Found\n\n";
      message += "URI: ";
      message += server.uri();
      message += "\nMethod: ";
      message += (server.method() == HTTP_GET)?"GET":"POST";
      message += "\nArguments: ";
      message += server.args();
      message += "\n";
      for (uint8_t i=0; i<server.args(); i++){
        message += " " + server.argName(i) + ": " + server.arg(i) + "\n";
      }
      this->server.send(404, "text/plain", message);
      digitalWrite(LED, 0);
    });   
    
  };

  void begin() {
    server.begin();
    Serial.println("HTTP server started");
  }
  
  void handle() {
    server.handleClient();  
  };

private:
  CoolSwitch& coolSwitch;
  CoolSwitchConfig& config;
  ESP8266WebServer server;  
};

#endif
