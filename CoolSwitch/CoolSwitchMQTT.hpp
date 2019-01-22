#include "CoolSwitch.hpp"
#include <Arduino.h>

#ifndef COOL_SWITCH_MQTT_H
#define COOL_SWITCH_MQTT_H

class CoolSwitchMQTT {
public:
  CoolSwitchMQTT(CoolSwitch& coolSwitch) 
    : coolSwitch(coolSwitch) {    
  }
  void handle() {
    // TODO
  };

private:
  CoolSwitch& coolSwitch;
};
#endif
