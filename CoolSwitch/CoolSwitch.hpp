#ifndef COOL_SWITCH_H
#define COOL_SWITCH_H

#include "CoolSwitchCurrentSensor.hpp"

enum State { OFF, ON, SOFT_START, SOFT_STOP, OVER_CURRENT } ;

class PWMPin {
public:
  PWMPin(const uint8_t pin) 
    : pin(pin), speed(1024) {    
    pinMode(pin, OUTPUT);
    turnOff();
  };

  void setSpeed(const float speedPercent) {
    uint16_t newSpeed = speedPercent * 1024;
    if (newSpeed == this->speed) {
      return;
    }
    Serial.print("pwm speed: ");
    Serial.println(newSpeed);
    this->speed = newSpeed;
    if (this->on) {
      writeSpeed(this->speed);
    }
  };

  void turnOn() {
    this->on = true; 
    writeSpeed(this->speed);
  };

  void turnOff() {
    this->on = false;
    writeSpeed(0);
  };

private:
  const uint8_t pin;
  uint16_t speed;
  bool on;

  void writeSpeed(uint16_t speed) {
    Serial.print("writeSpeed: ");
    Serial.println(speed);
    analogWrite(pin, speed);
  }; 
};

class CoolSwitch {
public:
  CoolSwitch(const uint8_t pin)
    : state(OFF), pwmPin(pin) {
      
      turnOff();
  }

  void setSpeed(float speed) {
    Serial.print("Speed: ");
    Serial.println(speed);
    this->speed = speed;
    this->pwmPin.setSpeed(speed);
  }

  void setCurrentLimit(float currentLimit) {
    Serial.print("Current limit: ");
    Serial.println(currentLimit);
    this->currentLimit = currentLimit;
  }

  void setSoftSwitchingDuration(uint32_t softSwitchingDuration) {
    Serial.print("Soft switching duration: ");
    Serial.println(softSwitchingDuration);
    this->softSwitchingDuration = softSwitchingDuration;
  }

  void enableSoftStartStop(bool enable) {
    Serial.println(enable ? "Soft switching enabled" : "Soft switching disabled");
    this->softSwitchingEnabled = enable;
  }

  void begin() {
    this->currentSensor.begin();
  }

  void handle() {
    this->currentSensor.handle();

    if (abs(this->currentSensor.getCurrentValue()) > currentLimit) {
      setState(State::OVER_CURRENT);
      return;
    }

    if (state == ON && (millis() - lastHB) > hbOffTimout) {
      setState(State::OFF);
      return;
    }

    if (state == SOFT_START) {
      if (millis() > softSwitchingStarted + softSwitchingDuration) {
        setState(ON);
        
      } else {        
        pwmPin.setSpeed(speed * (((float) millis() - softSwitchingStarted) / softSwitchingDuration));
      }
      
    } else if (state == SOFT_STOP) {
      if (millis() > softSwitchingStarted + softSwitchingDuration) {
        setState(OFF);
        
      } else {        
        pwmPin.setSpeed(speed * (1.0 - ((float) millis() - softSwitchingStarted) / softSwitchingDuration));
      }
    }
  }
  
  void turnOn() { 
    this->lastHB = millis();
    if (this->state == OFF) {
      if (this->softSwitchingEnabled) {
        setState(SOFT_START);
        
      } else {
        setState(ON);
      }
    }    
  }
  
  void turnOff() {
    if (this->state != OFF) {
      if (this->softSwitchingEnabled) {
        setState(SOFT_STOP);
        
      } else {
        setState(OFF);
      }
    }
  }

  void setState(State state) {
    Serial.print("Set state: ");
    Serial.println(state);
    this->state = state;
    switch (state) {
    case ON:
      pwmPin.setSpeed(speed);
      pwmPin.turnOn();
      break;

    case SOFT_START:
      softSwitchingStarted = millis();
      pwmPin.setSpeed(0);
      pwmPin.turnOn();
      break;

    case SOFT_STOP:
      softSwitchingStarted = millis();
      break;
    
    case OFF:
    case OVER_CURRENT:
      pwmPin.turnOff();
      break;
    
    }
  }
  State getState() {
    return this->state;
  }

  State state;
  PWMPin pwmPin;
  CoolSwitchCurrentSensor currentSensor;

  String deviceName;
  
private:
  float currentLimit = 75.0;
  float speed = 1.0;

  bool softSwitchingEnabled = false;
  uint64_t softSwitchingStarted;
  uint32_t softSwitchingDuration = 5000; /* 5 sec */

  uint64_t lastHB = -1;
  uint32_t hbOffTimout = 60000; /* 60 sec */
};

#endif
