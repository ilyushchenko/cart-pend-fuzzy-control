clear all, close all, clc

m = 0.5;
M = 2;
L = 2;
g = -10;
d = 2;

dT = 0.1;

%tspan = 0:dT:10;
%y0 = [0; 0; .5; pi];
%[t,y] = ode45(@(t,y)cartpend(y,m,M,L,g,d,0),tspan,y0);

T = [];
Y = [];
y0 = [0; 0; 3*pi/2; 3*pi/2];
flurad = readfis('flurad.fis');
up = readfis('uprad.fis');

for i=1:dT:20
    T = [T i];
    
    if (y0(3) < pi/6 && y0(3) > 5*pi/6)
        
    flu = evalfis([y0(4), y0(3)], flurad);
     y0(3) = mod(y0(3),6.2831);
     y0(4) = mod(y0(4),6.2831);
    y0 = cartpendorg(y0,m,M,L,g,d,flu);
    else
        
    force = evalfis([y0(4), y0(3)], up);
    y0(3) = mod(y0(3),6.2831);
    y0(4) = mod(y0(4),6.2831);
    y0 = cartpendorg(y0,m,M,L,g,d,force);
    end
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