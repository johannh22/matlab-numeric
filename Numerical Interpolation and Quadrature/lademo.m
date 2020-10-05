% Demonstrating interpolation using the lagrange formula
clear
close all

% Function to be interpolated
f = @(x) cos(x + 0.1*x.^2 + 0.01*x.^3);

% Sample function in the given points
ti = 0;
tf = 5.5;
N = 10;

x = linspace(ti, tf, N);
y = f(x);

% Calculate the lagrange interpolation polynomial
[p, L] = lagrangeinterp(x, y);

% Sample points for plotting
S = 1000;
t = linspace(ti, tf, S);

% Plotting the function samples and the polynomial
figure(1)
subplot(2,1,1)
plot(t, f(t), 'b', t, polyval(p, t), 'r')
hold on
plot(x, f(x), 'ok')
axis([ti tf -1.1 1.1])
grid on
legend('Original Function','Lagrange Interpolation Polynomial', 'Function Sample Points')
title('Lagrange Interpolation')

subplot(2, 1, 2)
plot(t, f(t) - polyval(p,t))
title('Error')


% Plotting the interpolation basis
figure(2)
hold on
plot(t, polyval(p,t), 'LineWidth', 2)
for i = 1:N
    plot(t, polyval(L(i,:), t))
end
title('Lagrange Polynomial Basis for n = 10')
legend('Interpolation Polynomial')
