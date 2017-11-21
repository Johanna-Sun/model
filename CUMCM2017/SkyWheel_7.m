% initialize data set
xs = [];
ys = [];
zs = [];

xs2 = [];
ys2 = [];
zs2 = [];

% create 10X10 square
initDistance = 0.2;
index = 1;
j = 1;
k = 1;
while j < 11
    index = index + 1;
    xs2(index) = -1;
    ys2(index) = -1.2 + 0.2 * j;
    zs2(index) = 0;
    while k < 10
        index = index + 1;
        xs2(index) = xs2(index-1) + initDistance;
        ys2(index) = j*initDistance - 1-initDistance;
        zs2(index) = 0;
        k = k + 1;
    end
    k = 1;
    j = j + 1;
end

distance = 0.1532;
number = 100;
varT = (2*pi)/number;
theta = 0;
varX1 = theta;
varX2 = theta;
i = 1;
r = ((number)*distance)/2*pi;
x = 0;
y = 20;
while theta < pi
        varX1 = r*cos(theta);
        varX2 = r*cos(theta+varT);
        theta = theta + varT;
        ys(i) = (sqrt(r*r - varX1*varX1))*(1/sqrt(2));
        xs(i) = varX1+x;
        zs(i) = (sqrt(r*r - varX1*varX1))*((1/sqrt(2)))+y;
        i = i + 1;
        ys(i) = -(sqrt(r*r - varX2*varX2))*(1/sqrt(2));
        xs(i) = varX2+x;
        zs(i) = -(sqrt(r*r - varX2*varX2))*((1/sqrt(2)))+y;
        
        i = i + 1;
end



xs2([1]) = [];
ys2([1]) = [];
zs2([1]) = [];

hold on 
xlabel('x(10m)')
ylabel('y(10m)')
zlabel('z(10m)')
scatter3(xs,ys,zs);
scatter3(xs2,ys2,zs2);
axis([-40 40 -40 40 0 40])
hold off


xsSepInit = [];
ysSepInit = [];
zsSepInit = [];
i = 10;
j = 1;
while j <= 100
    xsSepInit(j) = xs2(i);
    ysSepInit(j) = ys2(i);
    zsSepInit(j) = zs2(i);
    if mod(j,10) == 0
        i = i + 19;
    end
    i = i - 1;
    j = j + 1;
 
end



xsSepEnd1 = [];
ysSepEnd1 = [];
zsSepEnd1 = [];
i = 1;
j = 1;
while i <= 100
        xsSepEnd1(j) = xs(i);
        ysSepEnd1(j) = ys(i);
        zsSepEnd1(j) = zs(i);
        j = j + 1;
    i = i + 1;
end

sepResult1 = [];
i = 1;
j = 1;
index = 1;
hold on
xlabel('x(10m)')
ylabel('y(10m)')
zlabel('z(10m)')
scatter3(xs,ys,zs);
scatter3(xs2,ys2,zs2);
axis([-40 40 -40 40 0 40])
while i <= 100
    j = 1;
    while j <= 100
        if (i ~= 1) && sepResult1(j) == 40
            j = j + 1;
        else
            sepResult1(j) = sqrt((-(xsSepInit(i)) + (xsSepEnd1(j))));
            j = j + 1;
        end
    end
    [maxr,index] = min(sepResult1);
    plot3([xsSepInit(i) xsSepEnd1(index)],[ysSepInit(i) ysSepEnd1(index)],[zsSepInit(i) zsSepEnd1(index)]);
    sepResult1(index) = 40;
    i = i + 1;
end
hold off
% hold on 
% xlabel('x(10m)')
% ylabel('y(10m)')
% zlabel('z(10m)')
% scatter3(xsSepInit,ysSepInit,zsSepInit);
% scatter3(xsSepEnd,ysSepEnd,zsSepEnd);
% axis([-40 40 -40 40 0 40])
% hold off





