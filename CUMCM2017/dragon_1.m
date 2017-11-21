k = 0.5;
b = 1;
syms x y z;
eq1 = '(x^2 + y^2)^(1/2) = z';
w = k*x + b;
eq2 = 'z = -k*x + b*((1+k)/(1-k))';
S=solve(eq1,'y');
subs(eq2,y,S)
w3 = k*x + b*((1+k)/(1-k))^2;
w4 = -k*x + b*((1+k)/(1-k))^3;
hold on;
ezsurf(z,[-50 50 -50 50]);
% ezsurf(w,[-50 50 -50 0]);
ezsurf(w2,[-50 50 0 50]);
% ezsurf(s,[-50 50 -50 0]);
% ezsurf(w4,[-50 50 0 50]);
axis([-50 50 -50 50 -50 50])
hold off;
% 
% syms p1 p2 w r theta
% 
% eq1=r/2 + (p1*theta)/2 + (theta*w)/2 + 1/2-p2;
% 
% eq2=w/2 + (p2*theta)/2 + 1/2-p1;
% 
% s=solve(eq1,eq2,'p1,p2'); 
% 
% s.p1
% 
% s.p2

syms x y z
eq1='(45599*x)/50000- (1179*y)/500000 + (25554571*z)/1000000 + 159861847681/500000000=0';
eq2='x^2+y^2+z^2=1.4522e+03';
S=solve(eq1,'y');
subs(eq2,y,S)