# Webots-Robot-Simulation
Webots Robot Simulation with Fuzzy Control

Mathematical Models
The fuzzy control model
The fuzzy control model is designed to adjust the speed of the robot depending on the distance to the nearest obstacle. The model consists of the following components:
1. Input Variable: Obstacle Distance (D)
2. Output Variable: Robot Speed (V_robot)
3. Membership Functions:
o Distance: Very Close, Close, Moderate, Far, Very Far
o Speed: Stop, Slow, Moderate, Fast
4. Fuzzy Rules:
o If The Distance Is Very Close, then The Speed Will Stop
o If The Distance Is Close, then the Speed Is Slow
o If the Distance Is Moderate, then the Speed is Moderate
o If The Distance Is Far, then the Speed Is Fast
o If The Distance Is Very Far, then the Speed Is Fast
