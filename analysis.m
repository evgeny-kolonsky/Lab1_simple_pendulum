% מטוטלת פשותה איבוד ניטונים
% Evgeny Kolonsky Jan 2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Experiment 1:  T(theta)
% 
theta = [5 10 20 35 30 35 40 50 60 70 80]
theta_err = 1 * ones(11,1)
T10 = [14.37 14.52 14.62 14.69 14.66 14.76 14.88 15.08 15.28 15.53 16.22]
N = 10
T = T10 / N 
T10_err = 0.2 % s human eye error
T_err = T10_err/10 * ones(11,1) % 0.2s / 10
figure(1)
errorbar(theta, T, T_err, T_err, theta_err, theta_err, 'o')
xlabel('Theta, [grad]')
ylabel('T, [s]')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Experiment 2: T(l)
%

l1 = [508 480 432 410 332 303 330 370 420 462] % mm
l2 = 100 / 2 % mm
l = sqrt(l1 .* l1 - l2 * l2) % Pyfagorus
T10 = [14.62 14.09 13.39 13.02 11.65 11.22 11.78 12.63 13.19 13.83]
l_err = 2 % mm
delta_l = l_err ./ l % relative error
T10_err = 0.2 % s human eye error
delta_T = T10_err ./ T10 % relative error

Tmax = T10(1)
lmax = l(1)
lnT = log(T10/Tmax)
lnl = log(l/lmax)

lnT_err = delta_T ./ (T10 / Tmax)
lnl_err = delta_l ./ (l / lmax)

figure(2)
hold on
cf = fit(lnl',lnT','poly1')
alpha = cf.p1
plot(lnl, alpha * lnl)
errorbar(lnl, lnT, lnT_err, lnT_err, lnl_err, lnl_err, 'o')
plot(lnl, .5 * lnl)
xlabel('log l/lmax')
ylabel('log T/T(lmax)')
grid on
hold off
legend('fit','meas', 'expected alpha=0.5')