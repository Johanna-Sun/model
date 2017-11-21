% t=linspace(-1,1,2000);  %??t?????
% 
% x= -2 + 2*sqrt(2 - (t.^2/3));
% y= t.;
% [x,y]=meshgrid(x,y);%??????
% z = 4 + 2*sqrt(2 - t.^2/3)); %z????
% z(z>10) = nan;
% subplot(1,2,1)
% surf(x,y,z)
% shading interp

clear all;
clc;

t=-sqrt(6):0.0001:sqrt(6);
x=-2 + 2*sqrt(2 - (t.^2/3));
y=t;
z=4 + 2*sqrt(2 - t.^2/3);
x1=-2 - 2*sqrt(2 - (t.^2/3));
y1=t;
z1=4 - 2*sqrt(2 - t.^2/3);
hold on
plot3(x,y,z);
plot3(x1,y1,z1);
grid on;
hold off