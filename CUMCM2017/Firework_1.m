syms x y z;
A = [0.7,-0.7;0.7,0.7];
i = 1;
total = 16;
height = 0;
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



while i <= total
z1 = height;
x1 = distance*(i-1);
% xsInit(i) = x1;
% ysInit(i) = 0;
% zsInit(i) = z1;
z = height + x1*0.7;
x = x1*0.7;
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
    xs2(i+1) = 0.7*xs(2*i+1)-0.7*zs(2*i+1)-0.7*sin(0.25*pi*i)*L;
    zs2(i+1) = 0.7*xs(2*i+1)+0.7*zs(2*i+1)+0.7*sin(0.25*pi*i)*L;
    t = 0:0.01:5;
        xF = xs2(i+1)+(-0.3*xs(2*i+1)-0.7*zs(2*i+1)-0.7*sin(0.25*pi*i)*L) * (1*t);
        yF = ys2(i+1)+(cos(0.25*pi*i)*L) * (1*t);
        zF = zs2(i+1)+(0.7*xs(2*i+1)-0.3*zs(2*i+1)+0.7*sin(0.25*pi*i)*L) * (1*t) - 0.5*0.98*m*(t.^2);
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
    xs3(i) = 0.7*xs(2*i) - 0.7*zs(2*i) - 0.7*sin(0.125*pi + 0.25*pi*i)*l;
    ys3(i) = ys(2*i) + cos(0.125*pi + 0.25*pi*i)*l;
    zs3(i) = 0.7*xs(2*i)+0.7*zs(2*i)+0.7*sin(0.125*pi + 0.25*pi*i)*l;
        t = 0:0.01:5;
        xF = xs3(i)+(-0.3*xs(2*i)-0.7*zs(2*i)-0.7*sin(0.25*pi*i)*L) * (1*t);
        yF = ys3(i)+(cos(0.25*pi*i)*L) * (1*t);
        zF = zs3(i)+(0.7*xs(2*i)-0.3*zs(2*i)+0.7*sin(0.25*pi*i)*L) * (1*t) - 0.5*0.98*m*(t.^2);
         plot3(xF,yF,zF,'color',co);
        grid on
      plot3([xs(2*i) xs3(i)],[ys(2*i) ys3(i)],[zs(2*i) zs3(i)],'color',co)
    i = i+1;
end



xlabel('x(10m)')
ylabel('y(10m)')
zlabel('z(10m)')
% scatter3(xsInit,ysInit,zsInit);
scatter3(xs,ys,zs)
scatter3(xs2,ys2,zs2)
% scatter3(xs3,ys3,zs3)
axis([-8 8 -8 8 -8 8])
hold off










%