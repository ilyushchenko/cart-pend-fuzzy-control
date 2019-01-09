clear all, close all, clc

m = 500;
M = 1500;
L = 10;
g = 10;
d = 1;

dT = 0.1;

%tspan = 0:1:100;
%y0 = [0; 0; 3*pi/2; 0];
%[t,y] = ode45(@(t,y)cartpend(y,m,M,L,g,d,0),tspan,y0);

%subplot(2,2,1);
%plot(t,y(:,1))
%grid on;

%subplot(2,2,2);
%plot(t,y(:,2))
%grid on;

%subplot(2,2,3);
%plot(t,y(:,3))
%grid on;

%subplot(2,2,4);
%plot(t,y(:,4))
%grid on;

%for k=1:length(t)
%    drawcartpend_bw(y(k,:),m,M,L);
%end

T = [];
Y = [];

y0 = [0; 1; 3*pi/2; 0];
y0 = cartpendorg(y0,m,M,L,g,d,0);
up = readfis('uprad.fis');
for i=1:dT:20
    
    T = [T i];
    
    theta = y0(3);
    dTheta = y0(4);
    
    force = evalfis([mod(dTheta, 2*pi), mod(theta, 2*pi)], up);
    y0 = cartpendorg(y0,m,M,L,g,d,force);
    %y0(3) = mod(y0(3),6.2831);
    %y0(4) = mod(y0(4),6.2831);
    

    Y = [Y y0];
end




%%
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

%%

%for k=1:length(15)
%    drawcartpend_bw(Y(k,:),m,M,L);
%end

% function dy = pendcart(y,m,M,L,g,d,u)