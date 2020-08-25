% ECE 481 Project - Image Stabilization
% Team Members: Clive Gomes, Dristi Chaudhuri, Nanjeeba Chowdhury
% Code Estimated Runtime: ~50mins

% Load original movie
load f;

% Define frame boundaries
ymin = 35;
ymax = 940;
xmin = 35;
xmax = 1465;
fbounds = [[ymin ymax];[xmin xmax]];

% Define range of displacements to test
flim = [[-27 6];[-15 1]];


% Stabilize Movie (~35mins)
g = stabilize(f,fbounds,flim);


% Remove Impulse Noise (~15mins)
g = removeNoise(g_stabilized(1:39,:,:),5);


% Sharpen Movie (~1mins)
g = sharpen(g,1,5);


% Create Final Movie (~30sec)

% Crop Original Movie to Same Size as Final Movie
f = crop3d(f,fbounds);

% Create Spacing Matrix
fsize = size(f);
gap = zeros(fsize(1),fsize(2),50);

% Concatenate Videos
g = cat(3,f,gap,g_stable_noise_sharp);

% Export AVI
exportAvi('finalMovie.avi',g);
