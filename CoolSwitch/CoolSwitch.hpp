#ifndef COOL_SWITCH_H
#define COOL_SWITCH_H

#include "CoolSwitchCurrentSensor.hpp"

enum State { ON, OFF, OVER_CURRENT } ;

class PWMPin {
public:
  PWMPin(const uint8_t pin) 
    : pin(pin), speed(1024) {    
    pinMode(pin, OUTPUT);
    turnOff();
  };

  void setSpeed(const float speedPercent) {
    this->speed = speedPercent * 1024;
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
    this->pwmPin.setSpeed(speed);
  }

  void setCurrentLimit(float currentLimit) {
    this->currentLimit = currentLimit;
  }

  void enableSoftStartStop(bool enable) {
    // TODO
  }

  void begin() {
    this->currentSensor.begin();
  }

  void handle() {
    this->currentSensor.handle();

    if (abs(this->currentSensor.getCurrentValue()) > currentLimit) {
      setState(State::OVER_CURRENT);
    }
  }
  
  void turnOn() {    
    setState(ON);
  }
  
  void turnOff() {    
    setState(OFF);
  }

  void setState(State state) {
    this->state = state;
    switch (state) {
    case ON:
      pwmPin.turnOn();
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
  
private:
  float currentLimit = 75.0;
};

#endif
