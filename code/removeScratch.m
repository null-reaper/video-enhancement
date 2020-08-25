%%
close all; clear all; clc; 
load f;
p= squeeze(mean(f,2)); %get average of columns for all frames 
%Plot the p graph for all frames as a movie -- change the speed by changing the value in pause()
dim = size(p);
x = [1:dim(2)];
fig = figure(1);
%for n=1:dim(2); %for loop removed after viewing video and recognizing
%frame with highest peak
n=20; %Selected one frame after viewing video 
clf(fig);
y= squeeze(p(n,:));
plot(x,y); xlabel('Number of columns'); ylabel('Average of columns');
pause(0.01);
%end

xgood= [1:495, 527:1501];%selected the normal regions based on figure 1 values
xpatch= [496:526]; %area needing patch 
pgood = squeeze(p(20,xgood)); %frame= 20
ppatch= interp1(xgood, pgood, xpatch, 'spline'); %interpolation using spline
p_final= [pgood(1:495), ppatch(1:31), pgood(496:1470)]; %replace corrupted area with patch
figure(2); plot(x,p_final); xlabel('Number of columns'); ylabel('Average of columns');%plot new figure with patch