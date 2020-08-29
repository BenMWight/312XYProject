time = 1;
width = 2;
height = 3;
step = 1000; % per second
t = linspace(0,time,step);
x = [linspace(0,width,step/4) linspace(width,width,step/4) linspace(width,0,step/4) linspace(0,0,step/4)];
y = [linspace(0,0,step/4) linspace(0,height,step/4) linspace(height,height,step/4) linspace(height,0,step/4)];
xt = [x; t]';
square = [t; x;  y];
%plot3(x, t, y);

r = 10;
x_c = r*sin(t*2*pi);
y_c = r*cos(t*2*pi);
%plot3(x_c, t, y_c);

t = [t t+1];
xf = [x x_c];
yf = [y y_c];

plot3(xf, t, yf);
xlabel('X');
ylabel('Time');
zlabel('Y')