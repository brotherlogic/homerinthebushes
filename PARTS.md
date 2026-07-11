# Homer in the Bushes - Automation Parts List

Here is the complete list of hardware components you will need to build the automated "Homer in the Bushes" model with geofencing capabilities.

## 1. The Core Build
*   **Homerwear "Homer in the Bushes" Kit**: The 227-piece base model with the manual gear mechanism.

## 2. Microcontroller & Brains
*   **Raspberry Pi Pico W**: The brains of the operation. The "W" version is critical because it includes the WiFi chip needed to connect to your home network and Home Assistant. Ensure you get one with pre-soldered header pins if you don't want to solder them yourself.

## 3. Motion & Drive
*   **28BYJ-48 Stepper Motor (5V)**: A small, inexpensive geared stepper motor that provides the slow, precise movement needed to slide Homer in and out without breaking the plastic gears.
*   **ULN2003 Motor Driver Board**: This small chip/board takes the low-power logic signals from the Raspberry Pi Pico and boosts them to provide enough current to drive the stepper motor. (These are almost always sold together in a pack with the 28BYJ-48 motor).

## 4. Mechanical Coupling (Choose One)
*   **3D Printed Adapter (Recommended)**: A custom-printed sleeve that connects the 5mm D-Shaft of the motor to the Lego cross-axle. (Search "28BYJ-48 Lego adapter" on Thingiverse).
*   **5mm to 5mm Flexible Shaft Coupler**: An aluminum coupling (often used for 3D printers or CNC machines) with set screws to manually grip both the motor shaft and the Lego axle if you don't have a 3D printer.

## 5. Wiring & Power
*   **Jumper Wires**: A pack of standard Dupont jumper wires. You will likely need **Female-to-Female** wires to connect the Pico's pins to the ULN2003 driver board.
*   **Breadboard (Optional but helpful)**: A half-size breadboard makes wiring the Pico and distributing power much easier without needing to solder.
*   **5V Power Supply**: A 5V power supply capable of outputting at least 2 Amps (e.g., a decent USB wall charger). You will use this to power the Raspberry Pi Pico via its USB port. The Pico can then supply the 5V signal from its `VBUS` pin to power the motor driver.
