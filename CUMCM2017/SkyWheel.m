% initialize data set
syms x y;
xs = [];
ys = [];
zs = [];

xs2 = [-1];
ys2 = [-1];
zs2 = [-0.6];

index = 1;
j = 1;
k = 1;
while j < 11
    while k < 12
        index = index + 1;
        xs2(index) = xs2(index-1) + 0.2;
        ys2(index) = j;
        zs2(index) = -0.6;
        k = k + 1;
    end
    k = 1;
    j = j + 1;
    xs2(index) = -1;
    ys2(index) = -1;
    zs2(index) = -0.6;
end

i = 1;
r = 2;
x = 0;
y = 0;
theta = 0;
varX = -r;
while varX < r
        ys(i) = 0;
        xs(i) = varX+x;
        zs(i) = (sqrt(r*r - varX*varX)+y);
        i = i + 1;
        ys(i) = 0;
        xs(i) = varX+x;
        zs(i) = -(sqrt(r*r - varX*varX)+y);
        varX = varX + 0.2;
        i = i + 1;
end

% hold on 
scatter3(xs,ys,zs);
axis([-2 2 -2 2 -2 2])
% scatter3(xs2,ys2,zs2);
% hold off
% hold off