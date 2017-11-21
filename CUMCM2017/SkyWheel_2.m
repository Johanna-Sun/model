% initialize data set
xs = [];
ys = [];
zs = [];

% ys(1) = 1;

i = 1;
r = 2;
x = 0;
y = 0;
theta = 0;
varX = -r;
while theta < pi/4
        ys(i) = (sqrt(r*r - varX*varX)+y)*(1/sqrt(2));
        xs(i) = varX+x;
        zs(i) = (sqrt(r*r - varX*varX)+y)*(1-(1/sqrt(2)));
        i = i + 1;
        ys(i) = -(sqrt(r*r - varX*varX)+y)*(1/sqrt(2));
        xs(i) = varX+x;
        zs(i) = -(sqrt(r*r - varX*varX)+y)*(1-(1/sqrt(2)));
        varX = varX + (1-cos(theta));
        theta = theta + pi/36;
        i = i + 1;
end
varX = 0
while theta < pi/2
        ys(i) = (sqrt(r*r - varX*varX)+y)*(1/sqrt(2));
        xs(i) = varX+x;
        zs(i) = (sqrt(r*r - varX*varX)+y)*(1-(1/sqrt(2)));
        i = i + 1;
        ys(i) = -(sqrt(r*r - varX*varX)+y)*(1/sqrt(2));
        xs(i) = varX+x;
        zs(i) = -(sqrt(r*r - varX*varX)+y)*(1-(1/sqrt(2)));
        varX = varX + cos(theta);
        theta = theta + pi/36;
        i = i + 1;
end

scatter3(xs,ys,zs);