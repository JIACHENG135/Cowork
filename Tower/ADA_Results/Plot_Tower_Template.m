%% Data_Analysis_Tower
clear all; close all; clc
% load Plate_Raman_Example.mat
LoadFileName = 'all'; % File name for loading
% Loading variables
load(LoadFileName)
%% Below is the codes for plotting

figure('Color', [240/255,1,1])
plot(x,m_earth,x,m_mars,x,m_moon,'LineWidth',2)
xlabel('Tower Height','Interpreter','latex')
ylabel('$Mass~Required$','Interpreter','latex')
title('Tower Mass v.s. Height (Aluminum) $P = 1000kg$','Interpreter','latex')
set(gca,'fontsize', 15,'linewidth',1.15)
set(gca,'ticklength',1.2*get(gca,'ticklength'))
legend('Earth ($9.81 kg/m^2$)','Mars ($3.71 kg/m^2$)','Moon ($1.62 kg/m^2$)','Interpreter','latex')



% Hist.Nhist = myNhist(:,:,1:2000);
% Hist.t = myt;
% 
% plate.Bradius = 0.03*ones(size(plate.C_b,1),1); % Radius of bars [# bars x 1]
% % plate.Sradius = 0.005*ones(size(plate.C_s,1),1); % Radius of strings [# strings x 1]
% % plate.Nradius = 0.01*ones(size(N,2),1); % Radius of node spheres [# nodes x 1]
% 
% tenseg_animation(Hist,plate,[],[],[1 0 0],[],5)