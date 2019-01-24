#include "CoolSwitch.hpp"
#include <Arduino.h>

#ifndef COOL_SWITCH_CONFIG_H
#define COOL_SWITCH_CONFIG_H

class CoolSwitchConfig {
public:
  CoolSwitchConfig() {    

  }

  void load() {
    Serial.println("Initializing SPIFFS...");
    SPIFFS.begin();
    Serial.println("SPIFFS initialized.");
    if (!SPIFFS.exists("/formatComplete.txt")) {
      Serial.println("Please wait 30 secs for SPIFFS to be formatted");
      SPIFFS.format();
      File f = SPIFFS.open("/formatComplete.txt", "w");
      if (!f) {
        Serial.println("file open failed");
      } else {
        f.println("Format Complete");
      }
    }

    // load settings
    this->wifiSSID = readString("WifiSSID.txt");
    this->wifiPassword = readString("WifiPassword.txt");
    this->mqttServer = readString("MqttServer.txt");
    this->mqttPort = readString("MqttPort.txt");
    this->httpSecret = readString("HttpSecret.txt");
  }

  void save() {
    writeString("WifiSSID.txt", wifiSSID);
    writeString("WifiPassword.txt", wifiPassword);
    writeString("MqttServer.txt", mqttServer);
    writeString("MqttPort.txt", mqttPort);
    writeString("HttpSecret.txt", httpSecret);
  };

  void handle() {
    
  };

  String wifiSSID = "";
  String wifiPassword = "";
  String mqttServer = "";
  String mqttPort = "12948";
  String httpSecret = "";

private:
  String readString(const String filename) {
    if (!SPIFFS.exists(filename)) {
        return "";
    }

    File file = SPIFFS.open(filename, "r");
    String content = file.readStringUntil('\n');
    file.close();
    return content;
  };

  void writeString(const String filename, const String value) {
    File file = SPIFFS.open(filename, "w+");
    file.print(value);
    file.print("\n");
    file.close();
  };
};
#endif
