#ifndef COOL_SWITCH_CURRENT_SENSOR_H
#define COOL_SWITCH_CURRENT_SENSOR_H

#include "CoolSwitch.hpp"
#include <Arduino.h>

const uint8_t TLI4970_CS = 0 /* old 9 */;
const uint8_t TLI4970_OCD = 10;
const uint8_t TLI4970_DIO = 7;

class CoolSwitchCurrentSensor {
public:
  CoolSwitchCurrentSensor() {
  };

  void begin() {
    Serial.println("TLI4970 init...");

    if (SPI.pins(6, 7, 8, 0)) {
      Serial.println("SP set pins OK");
    } else {
      Serial.println("SP set pins FAILED");
    }
  
    tli4970CurrentSensor.setPinOCD(TLI4970_OCD);
    tli4970CurrentSensor.begin(SPI, TLI4970_CS, TLI4970_DIO);  
    Serial.println("TLI4970 initialized");
  };

  void handle() {
    int currTime = millis();
    if (currTime > nextRead) {
      //Serial.println("READ");  
      nextRead = currTime + 5;
    
      if(tli4970CurrentSensor.readOut()) {
        //Serial.print("FAIL: ");
        //Serial.println(tli4970CurrentSensor.getStatus());
      } else {
        //Serial.print("Success: ");
        //Serial.print(" - curr:");
        if (tli4970CurrentSensor.getStatus() != 0) {
          this->current = tli4970CurrentSensor.getCurrent();
          //Serial.println(tli4970CurrentSensor.getCurrent(), 6);
        
        } else {
          //Serial.println("ZERO / NO DATA");
        }
        //Serial.print(" - status:");
        //Serial.println(tli4970CurrentSensor.getStatus());
        //Serial.print(" - curr message:");
        //Serial.println(tli4970CurrentSensor.getCurrMessage());
      }
    }  
  };

  float getCurrentValue() {
    return current;
  }

private:
  Tli4970 tli4970CurrentSensor;
  int nextRead = -1;
  float current = 0.0;
};
#endif
