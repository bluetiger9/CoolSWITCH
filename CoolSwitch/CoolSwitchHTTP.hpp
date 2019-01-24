#ifndef COOL_SWITCH_HTTP_H
#define COOL_SWITCH_HTTP_H

#include "CoolSwitch.hpp"
#include "CoolSwitchConfig.hpp"
#include <Curve25519.h>
#include <SHA256.h>
#include <Arduino.h>
#include <libb64/cdecode.h>
#include <libb64/cencode.h>

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
      if (!hmacVerifyUrl()) {
        return;
      }
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

        } if ((this->server.argName(i) == "seqNr") || (this->server.argName(i) == "nonce") || (this->server.argName(i) == "hmac")) {
          // do nothing
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
      if (!hmacVerifyUrl()) {
        return;
      }

      this->coolSwitch.turnOff();
      this->server.send(200, "text/plain", "Ok");
    });
  
    this->server.on("/turnOn", [this]() {
      if (!hmacVerifyUrl()) {
        return;
      }

      this->coolSwitch.turnOn();
      this->server.send(200, "text/plain", "Ok");
    });

    this->server.on("/current", [this]() {
      String message;
      message += this->coolSwitch.currentSensor.getCurrentValue();
      this->server.send(200, "text/plain", message);
    });

    this->server.on("/secret", [this]() {
      if (!hmacVerifyUrl()) {
        return;
      }

      if (this->server.args() < 1) {
        this->server.send(204, "text/plain", "missing key");
        return;
      }

      uint8_t ourSecret[32];
      uint8_t ourPublic[32];

      // read the counterparty's public key
      String otherKey64 = this->server.arg(0);
      Serial.print("counterparty's public key: ");
      Serial.println(otherKey64);

      char otherKey64cstr[128];
      otherKey64.toCharArray(otherKey64cstr, 128);

      uint8_t otherPublic[128];
      base64_decode_chars(otherKey64cstr, 128, (char*) otherPublic);

      // Generate the secret value "ourSecret" and the public value "ourPublic".
      Serial.print("DH1");
      Curve25519::dh1(ourPublic, ourSecret);

      // Generate the shared secret in "otherPublic" using the previous secret value "ourSecret".
      Serial.print("DH2");
      if (!Curve25519::dh2(otherPublic, ourSecret)) {
        // The received public key value was invalid - abort the session.
        this->server.send(204, "text/plain", "invalid key");
        return;
      }

      // send our public key
      char publicBase64cstr[128];      
      base64_encode_chars((char*) ourPublic, 32, publicBase64cstr);

      String publicBase64(publicBase64cstr);
      Serial.print("our public key: ");
      Serial.println(publicBase64);
      this->server.send(200, "text/plain", publicBase64);

      // save the secret
      char secretBase64cstr[128];
      base64_encode_chars((char*) otherPublic, 32, secretBase64cstr);   
     
      this->secret = String(secretBase64cstr);
      Serial.print("Secret: ");
      Serial.println(secret);

      this->config.httpSecret = secret;
      this->config.save();
    });

    this->server.on("/reboot", [this](){
      if (!hmacVerifyUrl()) {
        return;
      }
      ESP.restart();
    });        
    
    this->server.on("/factoryReset", [this](){
      if (!hmacVerifyUrl()) {
        return;
      }
      this->config.wifiSSID = "";
      this->config.wifiPassword = "";
      this->config.mqttServer = "";
      this->config.mqttPort = "";
      this->config.httpSecret = "";
      this->config.httpSecret = "";
      this->config.save();
      ESP.restart();
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
    secret = config.httpSecret;
    server.begin();
    Serial.println("HTTP server started");
  }
  
  void handle() {
    server.handleClient();  
  };

  bool hmacVerifyUrl() {
    if (secret == "") {
      return true;
    }
    
    Serial.println("HMAC:");
    String payload = server.uri() + "?";

    String hmac = "";
    float seqNrNew = -2;
    bool hasNonce = false;
    bool first = true;
    for (int i = 0; i < this->server.args(); ++i) {
       if (this->server.argName(i) == "hmac") {
         hmac = this->server.arg(i);
           
       } else {
         if (!first) {
            payload += "&";
            
         } else {
            first = false;
         }
         payload += this->server.argName(i) + "=" + this->server.arg(i);
         if (this->server.argName(i) == "seqNr") {
           seqNrNew = this->server.arg(i).toFloat();
           
         } else if (this->server.argName(i) == "nonce") {
           hasNonce = true;
         }
       }
    }
    if (hmac == "") {
      this->server.send(403, "text/plain", "missing hmac");
      return false;
      
    } else if (seqNrNew < this->seqNr) {
      this->server.send(403, "text/plain", "invalid seqNr");
      return false;
      
    } else if (!hasNonce) {
      this->server.send(403, "text/plain", "missing nonce");
      return false;
    }

    this->seqNr = seqNrNew;
    
    Serial.print("  payload: ");
    Serial.println(payload);
    Serial.print("  hmac (received): ");
    Serial.println(hmac);
    
    char payloadCstr[128];
    char hmacCalculatedBytes[64];    
    (payload + secret).toCharArray(payloadCstr, 128);

    SHA256 sha256;
    sha256.update(payloadCstr, (payload + secret).length());
    sha256.finalize(hmacCalculatedBytes, 32);

    char hmacCalculatedHex[65];
    for (unsigned int i = 0; i < 32; i++)
    {
        byte nib1 = (hmacCalculatedBytes[i] >> 4) & 0x0F;
        byte nib2 = (hmacCalculatedBytes[i] >> 0) & 0x0F;
        hmacCalculatedHex[i*2+0] = nib1  < 0xA ? '0' + nib1  : 'a' + nib1  - 0xA;
        hmacCalculatedHex[i*2+1] = nib2  < 0xA ? '0' + nib2  : 'a' + nib2  - 0xA;
    }
    hmacCalculatedHex[64] = '\0';

    String hmacCalculated(hmacCalculatedHex);    
    Serial.print("  hmac (calculated): ");
    Serial.println(hmacCalculated);

    if (hmacCalculated != hmac) {
      this->server.send(403, "text/plain", "incorrect hmac");
      return false;
      
    } else {
      return true;
    }
  }

private:
  CoolSwitch& coolSwitch;
  CoolSwitchConfig& config;
  ESP8266WebServer server;

  String secret = "";
  float seqNr = -1;
};

#endif
