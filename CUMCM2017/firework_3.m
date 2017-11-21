syms x y z;
A = [(1/sqrt(2)),-(1/sqrt(2));(1/sqrt(2)),(1/sqrt(2))];
i = 1;
total = 16;
height = 10;
radius = height*sqrt(2);
minusX = radius*cos(0.25*pi);
minusZ = radius*sin(0.25*pi);
distance = 0.15;
l = 2.5;
L = 5;

xsInit = [];
ysInit = [];
zsInit = [];
xs = [];
ys = [];
zs = [];

hold on




radius = height*sqrt(2);
distance = 0.15;

i = 0;
while i < total
    
theta = 0:0.001:0.25*pi;
xT = radius*cos(theta) - height;
yT = 0*theta;
zT = radius*sin(theta) - height;
xsInit(i+1) = radius*cos(0) - height;
ysInit(i+1) = 0;
zsInit(i+1) = radius*sin(0) - height;
 plot3(xT,yT,zT);
radius = radius + distance;
i = i + 1;
end

i = 1;
while i <= total
z1 = 0;
x1 = distance*(i-1);
z = 0 + x1*(1/sqrt(2));
x = x1*(1/sqrt(2));
y = 0;
xs(i) = x;
ys(i) = y;
zs(i) = z;
% plot3([xsInit(i) xs(i)],[ysInit(i) ys(i)],[zsInit(i) zs(i)]);
i = i + 1;
end


xs2 = [];
ys2 = [];
zs2 = [];
i = 0;
m = 100;
% t = 2;
while i < 8
    co = [rand,rand,rand];
    ys2(i+1) = ys(2*i+1) + cos(0.25*pi*i)*L;
    xs2(i+1) = (1/sqrt(2))*xs(2*i+1)-(1/sqrt(2))*zs(2*i+1)-(1/sqrt(2))*sin(0.25*pi*i)*L;
    zs2(i+1) = (1/sqrt(2))*xs(2*i+1)+(1/sqrt(2))*zs(2*i+1)+(1/sqrt(2))*sin(0.25*pi*i)*L;
    t = 0:0.01:5;
        xF = xs2(i+1)+(-0.3*xs(2*i+1)-(1/sqrt(2))*zs(2*i+1)-(1/sqrt(2))*sin(0.25*pi*i)*L) * (1*t);
        yF = ys2(i+1)+(cos(0.25*pi*i)*L) * (1*t);
        zF = zs2(i+1)+((1/sqrt(2))*xs(2*i+1)-0.3*zs(2*i+1)+(1/sqrt(2))*sin(0.25*pi*i)*L) * (1*t) - 0.5*0.98*m*(t.^2);
          plot3(xF,yF,zF,'color',co);
        grid on
     
    
  plot3([xs(2*i + 1) xs2(i+1)],[ys(2*i + 1) ys2(i+1)],[zs(2*i + 1) zs2(i+1)],'color',co);
    i = i+1;
end


xs3 = [];
ys3 = [];
zs3 = [];
i = 1;
while i <= 8
    co = [rand,rand,rand];
    xs3(i) = (1/sqrt(2))*xs(2*i) - (1/sqrt(2))*zs(2*i) - (1/sqrt(2))*sin(0.125*pi + 0.25*pi*i)*l;
    ys3(i) = ys(2*i) + cos(0.125*pi + 0.25*pi*i)*l;
    zs3(i) = (1/sqrt(2))*xs(2*i)+(1/sqrt(2))*zs(2*i)+(1/sqrt(2))*sin(0.125*pi + 0.25*pi*i)*l;
        t = 0:0.01:5;
        xF = xs3(i)+(-0.3*xs(2*i)-(1/sqrt(2))*zs(2*i)-(1/sqrt(2))*sin(0.125*pi + 0.25*pi*i)*l) * (1*t);
        yF = ys3(i)+(cos(0.125*pi + 0.25*pi*i)*l) * (1*t);
        zF = zs3(i)+((1/sqrt(2))*xs(2*i)-0.3*zs(2*i)+(1/sqrt(2))*sin(0.125*pi + 0.25*pi*i)*l) * (1*t) - 0.5*0.98*m*(t.^2);
          plot3(xF,yF,zF,'color',co);
        grid on
       plot3([xs(2*i) xs3(i)],[ys(2*i) ys3(i)],[zs(2*i) zs3(i)],'color',co)
    i = i+1;
end



xlabel('x(10m)')
ylabel('y(10m)')
zlabel('z(10m)')
scatter3(xsInit,ysInit,zsInit);
scatter3(xs,ys,zs)
 scatter3(xs2,ys2,zs2)
 scatter3(xs3,ys3,zs3)
axis([-10 10 -10 10 -10 10])
hold off










%