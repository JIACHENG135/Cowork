%% Tower Calculation
close all;clear all;clc
Height = 4000;
x = 0:20:Height; % Tower Height
sigma = 110e06; % Aluminum
rho = 2700; % Aluminum
E = 60e09; % Young's Modulus
g_earth = 9.81; % gravity on the earth
g_moon = 1.62; % gravity on the moon
g_mars = 3.71; % gravity on the mars

%% Problem 1: Specify Payload mass
P = 10^3; % payolad mass in kg

% Mass of One Long Bar Buckling 
m_buckling = 2*rho/sqrt(pi*E)*Height^2*sqrt(P)
% Mass of One Long Bar Yielding 
m_yielding = rho*P/sigma*Height

A_earth = P*g_earth/sigma;
A_moon = P*g_moon/sigma;
A_mars = P*g_mars/sigma;

m_earth = A_earth*sigma/g_earth*(exp(rho*g_earth*x/sigma)-1);
m_mars = A_mars*sigma/g_mars*(exp(rho*g_mars*x/sigma)-1);
m_moon = A_moon*sigma/g_moon*(exp(rho*g_moon*x/sigma)-1);

figure('Color', [240/255,1,1])
plot(x,m_earth,x,m_mars,x,m_moon,'LineWidth',2)
xlabel('Tower Height','Interpreter','latex')
ylabel('$Mass~Required$','Interpreter','latex')
title('Tower Mass v.s. Height (Aluminum) $P = 1000kg$','Interpreter','latex')
set(gca,'fontsize', 15,'linewidth',1.15)
set(gca,'ticklength',1.2*get(gca,'ticklength'))
legend('Earth ($9.81 kg/m^2$)','Mars ($3.71 kg/m^2$)','Moon ($1.62 kg/m^2$)','Interpreter','latex')

save all.mat

% %% Probelm 2: Specify Top area of the Tower
% A_0 = pi*3^2; % Top Area of the Tower
% P_max = A_0*sigma; % Maximum payload mass at the top of the tower in kg

% m_earth = A_0*sigma/g_earth*(exp(rho*g_earth*x/sigma)-1);
% m_mars = A_0*sigma/g_mars*(exp(rho*g_mars*x/sigma)-1);
% m_moon = A_0*sigma/g_moon*(exp(rho*g_moon*x/sigma)-1);

% figure('Color', [230/255,230/255,250/255])
% plot(x,m_earth,x,m_mars,x,m_moon,'LineWidth',2)
% xlabel('Tower Height','Interpreter','latex')
% ylabel('$Mass~Required$','Interpreter','latex')
% title('Tower Mass v.s. Height (Aluminum) $A_0 = 1$','Interpreter','latex')
% set(gca,'fontsize', 15,'linewidth',1.15)
% set(gca,'ticklength',1.2*get(gca,'ticklength'))
% legend('Earth ($9.81 kg/m^2$)','Mars ($3.71 kg/m^2$)','Moon ($1.62 kg/m^2$)','Interpreter','latex')