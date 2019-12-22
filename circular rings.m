n = 1000;
d = 0.1;
x = zeros(2*n,2);

r = d*randn(n,1) + 2;
o = rand(n,1) * 2*pi;
x(1:n,1) = r .* cos(o);
x(1:n,2) = r .* sin(o);

r = d*randn(n,1) + 0.5;
o = rand(n,1) * 2*pi;
x(n+1:2*n,1) = r .* cos(o);
x(n+1:2*n,2) = r .* sin(o);

scatter(x(:,1),x(:,2));
hold on;

p2 = pca([x(:,1) x(:,2)]);
xb = (x(:,1) * p2(1,1) + x(:,2) * p2(2,1)) * p2(1,1);
yb = (x(:,1) * p2(1,1) + x(:,2) * p2(2,1)) * p2(2,1);
scatter(xb,yb);

z = (x(:,1).^2 + x(:,2).^2);
p1 = pca([x(:,1) x(:,2) z]);
xa = (x(:,1) * p1(1,1) + x(:,2) * p1(2,1) + z * p1(3,1)) * p1(1,1);
ya = (x(:,1) * p1(1,1) + x(:,2) * p1(2,1) + z * p1(3,1)) * p1(3,1);
scatter(xa,ya);

cc = 1;
dd = 2;
k = x * x';
k = k + cc;
k = k .^ dd;
[V,D] = eigs(k,1);
zz = k*V;
scatter(zz/100,zeros(2*n,1));

legend('original data','regular pca','manually added 3^{rd} dim then pca','polynomial kernelization');
hold off;
axis equal;
