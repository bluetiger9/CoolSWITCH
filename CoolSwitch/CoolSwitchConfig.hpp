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
  }

  void save() {
    writeString("WifiSSID.txt", wifiSSID);
    writeString("WifiPassword.txt", wifiPassword);
  };

  void handle() {
    
  };

  String wifiSSID = "";
  String wifiPassword = "";

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
