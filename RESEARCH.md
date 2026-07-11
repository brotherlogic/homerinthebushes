# Homer in the Bushes - Automation Project Plan

## Overview
The goal of this project is to modify the 227-piece "Homerwear" Homer in the Bushes kinetic model to be fully automated. When you arrive home, Homer will slide out of the bushes, and when you leave, he will slide back in. 

## Web Research Results
Web research reveals that the "Homer in the Bushes" model is a popular kinetic sculpture (with roots tracing back to designers like JK Brickworks). Standard kits (like the Homerwear one detailed in your instruction manual) use a manual hand crank to drive a rack-and-pinion gear mechanism that slides Homer back and forth.

Many makers have motorized similar Lego models using basic motors (like LEGO Power Functions). However, upgrading it with a microcontroller and smart home integration to respond to physical presence is a fantastic custom hack that takes it to the next level.

## Hardware Requirements
Based on your answers from our design interview, here is the hardware needed:

1. **The Homerwear Kit**: The base mechanical build as shown in the provided PDF instruction manual.
2. **Microcontroller**: **Raspberry Pi Pico W**. This board provides built-in WiFi, which is essential for communicating seamlessly over your local network.
3. **Motor**: A **Stepper Motor** (e.g., the inexpensive 28BYJ-48 with a ULN2003 driver board) or a **Standard Hobby Servo**. A stepper motor is highly recommended for this build because it provides precise control over how far the gear turns (by counting steps), ensuring the rack mechanism doesn't push Homer too far out or pull him too far back, which could strip the gears.
4. **Mechanical Coupling**: You will need a way to attach the motor's shaft to the cross-axle (the black rod shown being installed in steps 20-21 of the manual). A custom 3D printed adapter or a modified Lego Technic connector will be needed to couple the D-shaft of a stepper motor to the cross shape of the Lego axle.
5. **Power Supply**: A standard 5V power supply (like a USB wall adapter) capable of providing enough current to power both the Pico W and the motor simultaneously.

## Software Requirements
There are two main components to the software stack:

### 1. Raspberry Pi Pico W Firmware
You can write the firmware using MicroPython or C/C++. The firmware will need to:
- Connect to your home WiFi network on boot.
- Connect to an MQTT broker (often built into Home Assistant) or run a simple REST API web server.
- Listen for specific commands (e.g., `homer/extend` and `homer/retract`).
- Contain the logic to drive the stepper motor the exact number of steps forward or backward to slide the figure, without over-extending the mechanism.

### 2. Home Assistant Integration
Since you prefer to use Home Assistant for the geofencing rules:
- Add the Raspberry Pi Pico W as an entity in your Home Assistant dashboard (MQTT is the easiest way to do this).
- **Automations**: Create location-based automations using your smartphone's presence detection.
  - **Arriving Home Rule**: 
    - *Trigger*: User enters the "Home" zone.
    - *Action*: Publish "extend" payload to the Pico W.
  - **Leaving Home Rule**:
    - *Trigger*: User leaves the "Home" zone.
    - *Action*: Publish "retract" payload to the Pico W.
