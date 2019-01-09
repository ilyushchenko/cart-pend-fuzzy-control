%% Prepare

clear all, close all, clc
stab = readfis('stab.fis');
up = readfis('up.fis');
%% Defenition

m = 0.5;
M = 2;
L = 2;
g = -10;
d = 2;

dT = 0.1;

T = [];
Y = [];
%% System solution

%tspan = 0:dT:10;
%y0 = [0; 0; .5; pi];
%[t,y] = ode45(@(t,y)cartpend(y,m,M,L,g,d,0),tspan,y0);
%% FIS

y0 = [0; 0; 0; 3*pi/2];
for i=1:dT:20
    theta = y0(3);
    dTheta = y0(4);
    
    if (theta < pi/6 && theta > 5*pi/6)
        force = evalfis([dTheta, theta], stab);
    else
        force = evalfis([dTheta, theta], up);
    end
    
    y0(3) = mod(theta,pi*2);
    y0(4) = mod(dTheta,pi*2);
    y0 = cartpendorg(y0,m,M,L,g,d,force);
    
    T = [T i];
    Y = [Y y0];
end
%% Charts

subplot(2,2,1);
plot(T,Y(1, :));
grid on;

subplot(2,2,2);
plot(T, Y(2, :));
grid on;

subplot(2,2,3);
plot(T, Y(3, :));
grid on;

subplot(2,2,4);
plot(T, Y(4, :));
grid on

%% Simulation
%for k=1:length(15)
%    drawcartpend_bw(Y(k,:),m,M,L);
%end