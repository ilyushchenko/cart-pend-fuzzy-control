function dy = cartpendrad(y,m,M,L,g,d,u)

J = 0.006

Sy = sin(y(3));
Cy = cos(y(3));
D = (M + m)*(J + m*L^2);

dy(1,1) = y(2);
dy(2,1) = (1/D)*(-m^2*L^2*g*Cy*Sy + m*L^2*(m*L*y(4)^2*Sy - d*y(2))) + (m*L*L + J)*(1/D)*u;
dy(3,1) = y(4);

%magicCoef = .01*randn;
magicCoef = 0.0015;

dy(4,1) = (1/D)*((m+M)*m*g*L*Sy - m*L*Cy*(m*L*y(4)^2*Sy - d*y(2))) - (m*L*Cy + J)*(1/D)*u + magicCoef;