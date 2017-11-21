k = 0.5;
b = 1;
syms x y;
z = (x^2 + y^2)^(1/2);
w = k*x + b;
w2 = -k*x + b*((1+k)/(1-k));
w3 = k*x + b*((1+k)/(1-k))^2;
w4 = -k*x + b*((1+k)/(1-k))^3;
hold on;
ezsurf(z,[-50 50 -50 50]);
ezsurf(w,[-50 50 -50 0]);
ezsurf(w2,[-50 50 0 50]);
ezsurf(w3,[-50 50 -50 0]);
ezsurf(w4,[-50 50 0 50]);
axis([-50 50 -50 50 -50 50])
hold off;