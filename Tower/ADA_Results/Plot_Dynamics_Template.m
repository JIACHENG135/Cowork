%% Data_Analysis_Tower
clear all; close all; clc
% load Plate_Raman_Example.mat
LoadFileName = 'all'; % File name for loading
% Loading variables
load(LoadFileName)
%% Below is the codes for plotting

[N,C_b,C_s,parents] = tenseg_string_segment(N,C_b,C_s,segments);

lander.Bradius = 0.02*ones(size(C_b,1),1); % Radius of bars [# bars x 1]
lander.Sradius = 0.01*ones(size(C_s,1),1); % Radius of strings [# strings x 1]
lander.Nradius = 0.01*ones(size(N,2),1); % Radius of node spheres [# nodes x 1]

%% Plot structure to see what string segmentation looks like
plot_handle1 = tenseg_plot(N,C_b,C_s,[],[],[],[],lander);
axis off
hold on
[X,Y] = meshgrid(-0.8:0.05:0.8,-0.5:0.05:1);
Z = zeros(size(X));
surf(X,Y,Z,'MeshStyle','none','FaceColor',[0.99 0.99 0.99]);

%% Create plots with 3D objects 
lander.Bradius = 0.02*ones(size(C_b,1),1); % Radius of bars [# bars x 1]
lander.Sradius = 0.005*ones(size(C_s,1),1); % Radius of strings [# strings x 1]
lander.Nradius = 0.008*ones(size(N,2),1); % Radius of node spheres [# nodes x 1]
% lander.Bradius = 0.1*ones(size(lander.C_b,1),1); % Radius of bars [# bars x 1]
% lander.Sradius = 0.04*ones(size(lander.C_s,1),1); % Radius of strings [# strings x 1]
% lander.Nradius = 0.05*ones(size(lander.N,2),1); % Radius of node spheres [# nodes x 1]

% Plotting configurations
number_of_configurations = 3; % Number of configurations to plot
tenseg_plot_configurations(Hist, classK_test, number_of_configurations)

figure()
tenseg_plot_node(History,[2 3 4],[1 3])

X = History.Nhist(3,1:12,:);
centre_z_pos = sum(X)/12;
centre_z_pos = reshape(centre_z_pos,1,[]);

%%
figure()
plot(History.t,centre_z_pos,'LineWidth',2)
ylabel('Vertical Distance (m)','Interpreter','latex')
% ylim([19.99 20.01])
xlabel('Time (s)','Interpreter','latex')
% xticks([0 100 200 300 400 500 600])
% xticklabels({'0','10','20','30','40','50','60'})
% yticks([20-1e-12 20 20+1e-12 20+3e-12 20+5e-12])
% yticklabels({'20-1e^{-12}','20','20+1e^{-12}','20+3e^{-12}','20+5e^{-12}'})
    set(gca,'fontsize', 15,'linewidth',1.15)
    set(gca,'ticklength',1.2*get(gca,'ticklength'))
    
%%
for plot_no = 1800:10:1810

N_plot = History.Nhist(:,:,plot_no);
% % Plot structure to see what string segmentation looks like
plot_handle1 = tenseg_plot(N_plot,C_b,C_s,[],[],[],[],lander);
axis off
hold on
[X,Y] = meshgrid(-0.8:0.05:0.8,-0.5:0.05:1);
Z = -0.1*ones(size(X));
surf(X,Y,Z,'MeshStyle','none','FaceColor',[0.99 0.99 0.99]);
end

%%
bar_length_violation = History.bar_len(6,:)-ones(1,10001);
plot(History.t,bar_length_violation')
ylabel('Violation in bar length (m)','Interpreter','latex')
xlabel('Time (s)','Interpreter','latex')
set(gca,'fontsize', 15,'linewidth',1.15)
set(gca,'ticklength',1.2*get(gca,'ticklength'))
%%
% Create animation
tenseg_animation(History, lander,[],[],[],[],200)
