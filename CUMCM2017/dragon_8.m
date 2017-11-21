

clear all;
clc;


b = 1;
height = 10;
hold on
xlabel('x(10m)')
ylabel('y(10m)')
zlabel('z(10m)')

recX = [];
recY = [];
recZ = [];

initDistance = 0.15;
index = 1;
j = 1;
k = 1;
while j <= 10
    
    recX(index) = -3;
    y = -4 + 0.2 * j;
    recY(index) = -4 + 0.2 * j;
    recZ(index) = -20;
    while k < 5
        index = index + 1;
        recX(index) = recX(index-1) + initDistance;
        recY(index) = y;
        recZ(index) = -20;
        k = k + 1;
    end
    index = index + 1;
    k = 1;
    j = j + 1;
end



i = 1;
while i < 6
t = (5/12)*(3/2).^i*(-(1/3)*(-1).^i - (5/3)):0.0001:(5/12)*(3/2).^i*(-(1/3)*(-1).^i + (5/3));
x = t;
y = sqrt(-(24/25)*(t.^2) - (4/15)*(((-(3/2)).^i)*b*t) + (4/9)*(3/2).^(2*i));
z = -sqrt((1/25)*(t.^2) - (4/15)*(((-(3/2)).^i)*b*t) + (4/9)*(3/2).^(2*i));
plot3(x,y,z);
i = i + 1;
t = (5/12)*(3/2).^i*(-(1/3)*(-1).^i - (5/3)):0.0001:(5/12)*(3/2).^i*(-(1/3)*(-1).^i + (5/3));
x = t;
y = -sqrt(-(24/25)*(t.^2) - (4/15)*(((-(3/2)).^i)*b*t) + (4/9)*(3/2).^(2*i));
z = -sqrt((1/25)*(t.^2) - (4/15)*(((-(3/2)).^i)*b*t) + (4/9)*(3/2).^(2*i));
i = i + 1;
plot3(x,y,z);
grid on;
end



k = 1;
i = 1;
zz = 1;
xsC = [];
ysC = [];
zsC = [];
total = 50;
distance = 0.3;
totalDistance = 0;
j = (5/12)*(3/2)^i*(-(1/3)*(-1)^i - (5/3));

xs = [j];
ys = [sqrt(-(24/25)*(j^2) - (4/15)*(((-(3/2))^i)*b*j) + (4/9)*(3/2)^(2*i))];
zs = [-sqrt((1/25)*(j^2) - (4/15)*(((-(3/2))^i)*b*j) + (4/9)*(3/2)^(2*i))];
xsC(1) = xs(1);
ysC(1) = ys(1);
zsC(1) = zs(1);

while j < (5/12)*(3/2)^i*(-(1/3)*(-1)^i + (5/3))
    j = j + 0.0001;
    x = j;
    y = sqrt(-(24/25)*(j^2) - (4/15)*(((-(3/2))^i)*b*j) + (4/9)*(3/2)^(2*i));
    z = -sqrt((1/25)*(j^2) - (4/15)*(((-(3/2))^i)*b*j) + (4/9)*(3/2)^(2*i));
    DT = sqrt((x - xs(k))^2 + (y - ys(k))^2 + (z - zs(k))^2);
    D = sqrt((x - xsC(zz))^2 + (y - ysC(zz))^2 + (z - zsC(zz))^2);
    zz = zz + 1;
    xsC(zz) = x;
    ysC(zz) = y;
    zsC(zz) = z;
    totalDistance = totalDistance + D;
    if distance <= DT
        k = k + 1;
        xs(k) = x;
        ys(k) = y;
        zs(k) = z;
    end
end

real(totalDistance)
24.84 + 16.5653 + 11.0436 + 7.3624 + 4.9082 + 3.2722

fXsInit = [];
fYsInit = [];
fZsInit = [];
i = 50;
j = 1;
while i >= 1
    fXsInit(j) = recX(i);
    fYsInit(j) = recY(i);
    fZsInit(j) = recZ(i);
    i = i - 1;
    j = j + 1;
end

fXsInit2 = [];
fYsInit2 = [];
fZsInit2 = [];
i = 36;
j = 1;
while j <= 40
    fXsInit2(j) = recX(i);
    fYsInit2(j) = recY(i);
    fZsInit2(j) = recZ(i);
    if mod(j,5) == 0
        i = i - 10;
    end
    i = i + 1;
    j = j + 1;
end



i = 1;
while i <= 50;
    if i <= 10
    plot3([fXsInit(i) xs(i)],[fYsInit(i) ys(i)],[fZsInit(i) zs(i)]);
    else
    plot3([fXsInit2(i-10) xs(i)],[fYsInit2(i-10) ys(i)],[fZsInit2(i-10) zs(i)]);
    end
    i = i + 1;
end


scatter3(xs,ys,zs);
scatter3(recX,recY,recZ);
% scatter3(xs2,ys2,zs2);
hold off




