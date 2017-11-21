k = 0.5;
b = 1;
syms x y;
z = -sqrt(x^2 + y^2);
w3 = k*x - b*((1+k)/(1-k))^2;
w4 = -k*x - b*((1+k)/(1-k))^3;
hold on;
ezsurf(z,[-50 50 -50 50]);
ezsurf(w3,[-50 50 -50 50]);
ezsurf(w4,[-50 50 -50 50]);
hold off