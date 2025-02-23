% Step 1: Create a new Fuzzy Inference System (FIS)
fis = mamfis('Name', 'RobotNavigation');

% Step 2: Add Inputs and Outputs with Corrected Membership Functions
% Input 1: Distance to Obstacle (D)
fis = addInput(fis, [0 50], 'Name', 'Distance'); % Range: 0 to 50 meters
fis = addMF(fis, 'Distance', 'trapmf', [0 0 10 10], 'Name', 'VeryClose');
fis = addMF(fis, 'Distance', 'trapmf', [10 10 20 20], 'Name', 'Close');
fis = addMF(fis, 'Distance', 'trapmf', [20 20 30 30], 'Name', 'Moderate');
fis = addMF(fis, 'Distance', 'trapmf', [30 30 40 40], 'Name', 'Far');
fis = addMF(fis, 'Distance', 'trapmf', [40 40 50 50], 'Name', 'VeryFar');

% Output 1: Robot Speed (V_robot)
fis = addOutput(fis, [0 10], 'Name', 'Speed'); % Range: 0 to 10 units/sec
fis = addMF(fis, 'Speed', 'trapmf', [0 0 2 2], 'Name', 'Stop');
fis = addMF(fis, 'Speed', 'trapmf', [2 2 4 4], 'Name', 'Slow');
fis = addMF(fis, 'Speed', 'trapmf', [4 4 6 6], 'Name', 'Moderate');
fis = addMF(fis, 'Speed', 'trapmf', [6 6 10 10], 'Name', 'Fast');

% Step 3: Define Fuzzy Rules
ruleList = [
    1 1 1 1; % Rule 1: If Distance is VeryClose, then Speed is Stop
    2 2 1 1; % Rule 2: If Distance is Close, then Speed is Slow
    3 3 1 1; % Rule 3: If Distance is Moderate, then Speed is Moderate
    4 4 1 1; % Rule 4: If Distance is Far, then Speed is Fast
    5 4 1 1; % Rule 5: If Distance is VeryFar, then Speed is Fast
];

% Add rules to the FIS
fis = addRule(fis, ruleList);

% Step 4: Save the FIS
writeFIS(fis, 'robot_navigation.fis');

% Step 5: Visualize the FIS
fuzzyLogicDesigner(fis);
