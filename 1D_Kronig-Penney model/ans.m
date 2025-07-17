clc;
clear;

% Physical constants
hbar = 1.0545718e-34; % Js
m = 9.10938356e-31;   % kg
eV = 1.60218e-19;     % J

% Parameters
V0 = 3.0 * eV;          % Depth of well in Joules
d = 1.4e-10;            % Well width in meters
a_list = [2.8, 3.2]*1e-10;  % Lattice constants in meters
N = 7;                  % Plane wave cutoff (can vary for convergence)

% k-points
Nk = 200;
klist = linspace(-pi/a_list(1), pi/a_list(1), Nk);  % Cover full BZ

% Preallocate
E_bands = cell(1,2);
E0 = zeros(1,2);
W = zeros(1,2);
Eg = zeros(1,2);

for idx = 1:2
    a = a_list(idx);
    G = 2*pi/a;                         % Reciprocal lattice vector
    l = -N:N;                          % Plane wave indices
    Gvec = (2*pi/a)*l;                % Plane wave momenta
    num_basis = length(l);
    klist = linspace(-pi/a, pi/a, Nk); % Recompute for each 'a'

    E_band = zeros(num_basis, Nk);    % Energies

    % Build V matrix (independent of k)
    Vmat = zeros(num_basis);
    for m = 1:num_basis
        for n = 1:num_basis
            deltaG = Gvec(m) - Gvec(n);
            if deltaG == 0
                Vmat(m,n) = -V0 * d / a;
            else
                Vmat(m,n) = -V0 * sin(deltaG * d / 2) / (deltaG * a / 2);
            end
        end
    end

    % Loop over k values
    for ik = 1:Nk
        k = klist(ik);
        Tmat = diag((hbar^2 / (2*m)) * (Gvec + k).^2);
        H = Tmat + Vmat;
        energies = sort(eig(H)) / eV;  % Convert to eV
        E_band(:,ik) = energies;
    end

    % Store bands
    E_bands{idx} = E_band;

    % Analyze lowest 2 bands
    E0(idx) = min(E_band(1,:));
    W(idx) = max(E_band(1,:)) - min(E_band(1,:));
    Eg(idx) = min(E_band(2,:)) - max(E_band(1,:));

    % Plot
    figure(idx);
    plot(klist*a/pi, E_band(1,:), 'b', 'LineWidth', 2); hold on;
    plot(klist*a/pi, E_band(2,:), 'r', 'LineWidth', 2);
    xlabel('k (\pi/a)');
    ylabel('Energy (eV)');
    title(sprintf('Energy Bands for a = %.1f Å', a*1e10));
    legend('Band 1', 'Band 2');
    grid on;
end

% Print results
fprintf('\n===== Kronig-Penney Band Results =====\n');
for idx = 1:2
    a_val = a_list(idx)*1e10;
    fprintf('For a = %.1f Å:\n', a_val);
    fprintf('  E0  = %.4f eV\n', E0(idx));
    fprintf('  W   = %.4f eV\n', W(idx));
    fprintf('  Eg  = %.4f eV\n\n', Eg(idx));
end

