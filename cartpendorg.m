function dy = cartpendrad(y,m,M,L,g,d,u)

%xPos = y(1);
dX = y(2);
theta = y(3);
dTheta = y(4);

J = .006;

D = (M + m)*(J + m*L^2);

dy(1,1) = dX;
dy(2,1) = (1/D)*(-m^2*L^2*g*cos(theta)*sin(theta) + m*L^2*(m*L*dTheta^2*sin(theta) - d*dX)) + (m*L*L + J)*(1/D)*u;
dy(3,1) = dTheta;

%magicCoef = .01*randn;
magicCoef = 0.0015;

dy(4,1) = (1/D)*((m+M)*m*g*L*sin(theta) - m*L*cos(theta)*(m*L*dTheta^2*sin(theta) - d*dX)) - (m*L*cos(theta) + J)*(1/D)*u + magicCoef;