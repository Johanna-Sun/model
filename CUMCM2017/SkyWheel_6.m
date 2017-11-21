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


xsSepInit1 = [];
ysSepInit1 = [];
zsSepInit1 = [];
i = 5;
j = 1;
while j <= 25
    xsSepInit1(j) = xs2(i);
    ysSepInit1(j) = ys2(i);
    zsSepInit1(j) = zs2(i);
    if mod(j,5) == 0
        i = i + 15;
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
    if ys(i) < 0 && xs(i) < 0
        xsSepEnd1(j) = xs(i);
        ysSepEnd1(j) = ys(i);
        zsSepEnd1(j) = zs(i);
        j = j + 1;
    end
    i = i + 1;
end

sepResult = [];
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
while i <= 25
    j = 1;
    while j <= 25
        if (i ~= 1) && sepResult(j) == 40
            j = j + 1;
        else
            sepResult(j) = sqrt((-(xsSepInit1(i)) + (xsSepEnd1(j))));
            j = j + 1;
        end
    end
    [maxr,index] = min(sepResult);
     plot3([xsSepInit1(i) xsSepEnd1(index)],[ysSepInit1(i) ysSepEnd1(index)],[zsSepInit1(i) zsSepEnd1(index)]);
    sepResult(index) = 40;
    i = i + 1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xsSepInit2 = [];
ysSepInit2 = [];
zsSepInit2 = [];
i = 6;
j = 1;
while j <= 25
    xsSepInit2(j) = xs2(i);
    ysSepInit2(j) = ys2(i);
    zsSepInit2(j) = zs2(i);
    if mod(j,5) == 0
        i = i + 5;
    end
    i = i + 1;
    j = j + 1;
 
end



xsSepEnd2 = [];
ysSepEnd2 = [];
zsSepEnd2 = [];
i = 1;
j = 1;
while i <= 100
    if ys(i) <= 0 && xs(i) > 0
        xsSepEnd2(j) = xs(i);
        ysSepEnd2(j) = ys(i);
        zsSepEnd2(j) = zs(i);
        j = j + 1;
    end
    i = i + 1;
end



sepResult2 = [];
i = 1;
j = 1;
index = 1;

while i <= 25
    j = 1;
    while j <= 25
        if (i ~= 1) && sepResult2(j) == 40
            j = j + 1;
        else
            sepResult2(j) = sqrt((-(xsSepInit2(i)) + (xsSepEnd2(j))));
            j = j + 1;
        end
    end
    [maxr,index] = min(sepResult2);
    plot3([xsSepInit2(i) xsSepEnd2(index)],[ysSepInit2(i) ysSepEnd2(index)],[zsSepInit2(i) zsSepEnd2(index)]);
    sepResult2(index) = 40;
    i = i + 1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xsSepInit3 = [];
ysSepInit3 = [];
zsSepInit3 = [];
i = 95;
j = 1;
while j <= 25
    xsSepInit3(j) = xs2(i);
    ysSepInit3(j) = ys2(i);
    zsSepInit3(j) = zs2(i);
    if mod(j,5) == 0
        i = i - 5;
    end
    i = i - 1;
    j = j + 1;
 
end



xsSepEnd3 = [];
ysSepEnd3 = [];
zsSepEnd3 = [];
i = 1;
j = 1;
while i <= 100
    if ys(i) > 0 && xs(i) < 0
        xsSepEnd3(j) = xs(i);
        ysSepEnd3(j) = ys(i);
        zsSepEnd3(j) = zs(i);
        j = j + 1;
    end
    i = i + 1;
end



sepResult3 = [];
i = 1;
j = 1;
index = 1;

while i <= 25
    j = 1;
    while j <= 25
        if (i ~= 1) && sepResult3(j) == 40
            j = j + 1;
        else
            sepResult3(j) = sqrt((-(xsSepInit3(i)) + (xsSepEnd3(j))));
            j = j + 1;
        end
    end
    [maxr,index] = min(sepResult3);
     plot3([xsSepInit3(i) xsSepEnd3(index)],[ysSepInit3(i) ysSepEnd3(index)],[zsSepInit3(i) zsSepEnd3(index)]);
    sepResult3(index) = 40;
    i = i + 1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xsSepInit4 = [];
ysSepInit4 = [];
zsSepInit4 = [];
i = 96;
j = 1;
while j <= 25
    xsSepInit4(j) = xs2(i);
    ysSepInit4(j) = ys2(i);
    zsSepInit4(j) = zs2(i);
    if mod(j,5) == 0
        i = i - 15;
    end
    i = i + 1;
    j = j + 1;
 
end



xsSepEnd4 = [];
ysSepEnd4 = [];
zsSepEnd4 = [];
i = 1;
j = 1;
while i <= 100
    if ys(i) >= 0 && xs(i) > 0
        xsSepEnd4(j) = xs(i);
        ysSepEnd4(j) = ys(i);
        zsSepEnd4(j) = zs(i);
        j = j + 1;
    end
    i = i + 1;
end

length(xsSepEnd4)


sepResult4 = [];
i = 1;
j = 1;
index = 1;

while i <= 25
    j = 1;
    while j <= 25
        if (i ~= 1) && sepResult4(j) == 40
            j = j + 1;
        else
            sepResult4(j) = sqrt((-(xsSepInit4(i)) + (xsSepEnd4(j))));
            j = j + 1;
        end
    end
    [maxr,index] = min(sepResult4);
    plot3([xsSepInit4(i) xsSepEnd4(index)],[ysSepInit4(i) ysSepEnd4(index)],[zsSepInit4(i) zsSepEnd4(index)]);
    sepResult4(index) = 40;
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





