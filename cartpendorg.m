function dy = cartpendrad(y,m,M,L,g,d,f)

%xPos = y(1);
%dX = y(2);
%theta = y(3);
%dTheta = y(4);

xPos = y(1);
dX = y(2);
theta = y(3);
dTheta = y(4);

J = 200.006;

Lext = (J + m*L^2)/(m*L);


controlForce = f;

u1 = 1/(M + m - (m*L*cos(theta)^2)/Lext);
u2 = (controlForce - d*dX - (m*L*g*sin(theta*2)/(2*Lext)) + (m*L*dTheta^2*sin(theta)));

u = u1*u2;

Sy = sin(y(3));
Cy = cos(y(3));
D = (M + m)*(J + m*L^2);




dy(1,1) = dX;
%dy(2,1) = (1/D)*(-m^2*L^2*g*Cy*Sy + m*L^2*(m*L*y(4)^2*Sy - d*y(2))) + (m*L*L + J)*(1/D)*u;
dy(2,1) = u;
dy(3,1) = dTheta;
dy(4,1) = g / Lext * sin(theta) + 1/Lext*cos(theta);%*u;
%magicCoef = .01*randn;
%magicCoef = 0.0015;

%dy(4,1) = (1/D)*((m+M)*m*g*L*Sy - m*L*Cy*(m*L*y(4)^2*Sy - d*y(2))) - (m*L*Cy + J)*(1/D)*u + magicCoef;



