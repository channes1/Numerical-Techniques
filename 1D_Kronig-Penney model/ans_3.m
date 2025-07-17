clc;
clear;

% Constants
hbar = 1.0545718e-34;
m = 9.10938356e-31;
eV = 1.602176634e-19;

% Parameters
a = 2.8e-10;                % Lattice constant [m]
d = 1.4e-10;                % Well width [m]
V0 = 3.0 * eV;              % Potential depth [J]
N = 7;                      % Plane wave cutoff
k = pi / a;                 % Zone edge

% Plane wave basis
L = -N:N;
G = 2*pi*L/a;
sizeH = 2*N + 1;

% Construct Hamiltonian
H = zeros(sizeH, sizeH);
for i = 1:sizeH
    G_l = G(i);
    H(i,i) = (hbar^2 / (2*m)) * (G_l + k)^2;
    for j = 1:sizeH
        delta_l = L(j) - L(i);
        if delta_l == 0
            Vllp = -V0 * d / a;
        else
            Vllp = -V0 * sin(pi * delta_l * d / a) / (pi * delta_l);
        end
        H(i,j) = H(i,j) + Vllp;
    end
end

% Diagonalize Hamiltonian
[V, D] = eig(H);
[~, ind] = sort(diag(D)); % sort eigenvalues
V = V(:, ind);             % reorder eigenvectors

% Get coefficients for band 1 and 2
c1 = V(:,1);  % lowest band
c2 = V(:,2);  % second band

% x grid in unit cell
x_vals = linspace(-a/2, a/2, 1000);
psi1 = zeros(size(x_vals));
psi2 = zeros(size(x_vals));

% Construct psi_n,k(x) from plane wave basis
for l = 1:length(L)
    G_l = G(l);
    plane_wave = exp(1i * G_l * x_vals) / sqrt(a);
    psi1 = psi1 + c1(l) * plane_wave;
    psi2 = psi2 + c2(l) * plane_wave;
end

% Compute density
density1 = abs(psi1).^2;
density2 = abs(psi2).^2;

% Plotting
figure;
hold on;
plot(x_vals*1e10, density1, 'b', 'DisplayName','|\psi_{1,k=\pi/a}(x)|^2');
plot(x_vals*1e10, density2, 'r', 'DisplayName','|\psi_{2,k=\pi/a}(x)|^2');
fill([-d/2 d/2]*1e10, [1 1]*max([density1 density2])*1.1, [0.8 0.8 0.8], 
...
     'EdgeColor','none', 'FaceAlpha', 0.3, 'DisplayName','Potential 
Well');
xlabel('x (Å)');
ylabel('|\psi(x)|^2');
title('Electron Density at Zone Edge k = \pi/a');
legend;
grid on;

