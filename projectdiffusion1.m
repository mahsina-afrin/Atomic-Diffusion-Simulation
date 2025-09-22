clc; clear; close all;

%% Parameters
Nsteps = 5000;        % Number of diffusion steps
numAtoms = 5;         % Number of diffusing atoms
a_FCC = 0.404;        % Lattice constant FCC Al (nm)
a_BCC = 0.286;        % Lattice constant BCC Fe (nm)

%% Initialize positions [atoms x xyz x steps]
pos_FCC = zeros(numAtoms,3,Nsteps);
pos_BCC = zeros(numAtoms,3,Nsteps);

%% Random walk step function
move_atom = @(pos,a) pos + a*randn(1,3);

%% Simulate diffusion
for step = 2:Nsteps
    for atom = 1:numAtoms
        pos_FCC(atom,:,step) = move_atom(pos_FCC(atom,:,step-1),a_FCC);
        pos_BCC(atom,:,step) = move_atom(pos_BCC(atom,:,step-1),a_BCC);
    end
end

%% Calculate MSD
initial_FCC = repmat(pos_FCC(:,:,1), [1,1,Nsteps]);
initial_BCC = repmat(pos_BCC(:,:,1), [1,1,Nsteps]);

MSD_FCC = squeeze(mean(sum((pos_FCC - initial_FCC).^2,2),1));
MSD_BCC = squeeze(mean(sum((pos_BCC - initial_BCC).^2,2),1));

%% Diffusion Coefficient (Einstein relation)
time = (1:Nsteps)';   % make time a column vector
D_FCC = MSD_FCC ./ (6*time);
D_BCC = MSD_BCC ./ (6*time);

% Average over last 1000 steps for smoother value
D_FCC_avg = mean(D_FCC(end-999:end));
D_BCC_avg = mean(D_BCC(end-999:end));

fprintf('Average Diffusion Coefficient:\nFCC = %.4f nm^2/step, BCC = %.4f nm^2/step\n',...
    D_FCC_avg, D_BCC_avg);

%% Plot MSD
figure;
plot(time,MSD_FCC,'b','LineWidth',2); hold on;
plot(time,MSD_BCC,'r','LineWidth',2);
xlabel('Step'); ylabel('Mean Squared Displacement (nm^2)');
title('Atomic Diffusion: FCC (Al) vs BCC (Fe)');
legend('FCC','BCC'); grid on;

%% Plot Diffusion Coefficient
figure;
plot(time,D_FCC,'b','LineWidth',2); hold on;
plot(time,D_BCC,'r','LineWidth',2);
xlabel('Step'); ylabel('Diffusion Coefficient D (nm^2/step)');
title('Diffusion Coefficient: FCC vs BCC');
legend('FCC','BCC'); grid on;

%% Plot 3D Diffusion Path (first atom only)
figure;
plot3(squeeze(pos_FCC(1,1,:)),squeeze(pos_FCC(1,2,:)),squeeze(pos_FCC(1,3,:)),'b','LineWidth',1.5);
hold on;
plot3(squeeze(pos_BCC(1,1,:)),squeeze(pos_BCC(1,2,:)),squeeze(pos_BCC(1,3,:)),'r','LineWidth',1.5);
xlabel('X (nm)'); ylabel('Y (nm)'); zlabel('Z (nm)');
title('3D Diffusion Path: FCC vs BCC');
legend('FCC','BCC'); grid on; axis equal;
