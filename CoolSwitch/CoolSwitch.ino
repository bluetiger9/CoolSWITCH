#include <ESP8266WiFi.h>
#include <ESP8266mDNS.h>
#include <WiFiUdp.h>
#include <ArduinoOTA.h>
#include <ESP8266WebServer.h>
#include <Tli4970.h>
#include <Arduino.h>
#include <FS.h>
//#include <SPIFFS.h>

#include "CoolSwitch.hpp"
#include "CoolSwitchHTTP.hpp"
#include "CoolSwitchMQTT.hpp"
#include "CoolSwitchConfig.hpp"

const uint8_t LED = 2;
const uint8_t MOSFET_EN = 13;

CoolSwitchConfig config;
CoolSwitch coolSwitch(MOSFET_EN);
CoolSwitchHTTP httpInterface(coolSwitch, config);
CoolSwitchMQTT mqttInterface(coolSwitch);

char deviceId[25];

void setupDeviceId() {
  uint32_t chipid = ESP.getChipId();
  snprintf(deviceId, 25, "CoolSWITCH-%d", chipid);
}

void setupConfig() {
  config.load();
}

void setupWifi() {
  if (config.wifiSSID != "") {
    Serial.print("Connecting to Wifi network: ");
    Serial.println(config.wifiSSID);
    char wifiSSID[32], wifiPassword[32];    
    config.wifiSSID.toCharArray(wifiSSID, 32);
    config.wifiPassword.toCharArray(wifiPassword, 32);
    WiFi.mode(WIFI_STA);
    WiFi.begin(wifiSSID, wifiPassword);
    while (WiFi.waitForConnectResult() != WL_CONNECTED) {
      //config.wifiSSID = "";
      //config.save();
      Serial.println("Connection Failed! Rebooting...");
      delay(5000);
      ESP.restart();
    }
    Serial.println("Wifi connected.");
    
  } else {
    Serial.println("Setting up Wifi Soft AP:");
    WiFi.softAP(deviceId);
    Serial.print("  ssid: ");
    Serial.println(deviceId);
    Serial.print("  ip: 192.168.4.1");
  }  
}

void setup() {
  Serial.begin(115200);
  Serial.println("Booting");
  pinMode(LED, OUTPUT);  

  setupDeviceId();
  setupConfig();
  setupWifi();

  httpInterface.begin();
  
  // Port defaults to 8266
  // ArduinoOTA.setPort(8266);

  // Hostname defaults to esp8266-[ChipID]
  ArduinoOTA.setHostname(deviceId);

  // No authentication by default
  // ArduinoOTA.setPassword((const char *)"123");

  ArduinoOTA.onStart([]() {
    coolSwitch.turnOff();
    Serial.println("Start");
  });
  
  ArduinoOTA.onEnd([]() {
    Serial.println("\nEnd");
  });
  
  ArduinoOTA.onProgress([](unsigned int progress, unsigned int total) {
    Serial.printf("Progress: %u%%\r", (progress / (total / 100)));
  });
  
  ArduinoOTA.onError([](ota_error_t error) {  
    Serial.printf("Error[%u]: ", error);
    if (error == OTA_AUTH_ERROR) Serial.println("Auth Failed");
    else if (error == OTA_BEGIN_ERROR) Serial.println("Begin Failed");
    else if (error == OTA_CONNECT_ERROR) Serial.println("Connect Failed");
    else if (error == OTA_RECEIVE_ERROR) Serial.println("Receive Failed");
    else if (error == OTA_END_ERROR) Serial.println("End Failed");
    ESP.restart();
  });
  
  ArduinoOTA.begin();
  
  Serial.println("Ready");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  Serial.println("HTTP server started");

  delay(2000);
  coolSwitch.begin();
  
  Serial.println("OK");
}


void loop() {
  ArduinoOTA.handle();
  httpInterface.handle();
  mqttInterface.handle();
  coolSwitch.handle();
  
}
