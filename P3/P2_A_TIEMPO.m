clear all;
close all;
clc;

[e, ~] = audioread('e.wav');
[r, ~] = audioread('r.wav');
[z, ~] = audioread('z.wav');
[frase, ~] = audioread('frase.wav');

e = mean(e, 2);
r = mean(r, 2);
z = mean(z, 2);
frase = mean(frase, 2);

fs = 44100;

t_e = (0:length(e)-1)/fs;
t_r = (0:length(r)-1)/fs;
t_z = (0:length(z)-1)/fs;
t_frase = (0:length(frase)-1)/fs;

N = 882; % ventana de 20 ms: 0.02 * 44100 = 882

P_e=stpower(e, N);
P_r=stpower(r, N);
P_z=stpower(z, N);
P_frase=stpower(frase, N);

Z_e= stzerocross(e,N);
Z_r= stzerocross(r,N);
Z_z= stzerocross(z,N);
Z_frase= stzerocross(frase,N);

% --- FIGURA 1: Vocal e (Se mantiene como estaba) ---
figure('Name', 'Vocal e');
idx_zoom = find(t_e >= 0.7 & t_e <= 0.95);
% Subplot 1: Señal 'e'
subplot(3,1,1);
plot(t_e(idx_zoom), e(idx_zoom), 'LineWidth', 1.5);
title('Señal: e', 'FontSize', 14);
xlabel('Tiempo [s]', 'FontSize', 12);
ylabel('Amplitud', 'FontSize', 12);
ylim([-1 1]);
% Subplot 2: Potencia 'e'
subplot(3,1,2);
plot(t_e(idx_zoom), P_e(idx_zoom), 'LineWidth', 1.5);
title('Potencia: e', 'FontSize', 14);
xlabel('Tiempo [s]', 'FontSize', 12);
ylabel('Potencia', 'FontSize', 12);
ylim([-0.15 0.15]);
% Subplot 3: Cruces por cero 'e'
subplot(3,1,3);
plot(t_e(idx_zoom), Z_e(idx_zoom), 'LineWidth', 1.5);
title('Cruces por cero: e ', 'FontSize', 14);
xlabel('Tiempo [s]', 'FontSize', 12);
ylabel('Tasa de ZCR', 'FontSize', 12);
ylim([-0.15 0.15]);


% --- FIGURA 2: Consonante r (Ajustada a LineWidth 1.5 y Títulos 14) ---
figure('Name', 'Consonante r');
idx_zoom = find(t_r >= 0.85 & t_r <= 1.35);

% Subplot 1: Señal 'r' (zoom)
subplot(3,1,1);
plot(t_r(idx_zoom), r(idx_zoom), 'LineWidth', 1.5); % <-- Ajustado a 1.5
title('Señal: r', 'FontSize', 14); % <-- Ajustado a 14 y sin '(zoom...)'
xlabel('Tiempo [s]', 'FontSize', 12);
ylabel('Amplitud', 'FontSize', 12);
ylim([-1 1]);

% Subplot 2: Potencia 'r' (zoom)
subplot(3,1,2);
plot(t_r(idx_zoom), P_r(idx_zoom), 'LineWidth', 1.5); % <-- Ajustado a 1.5
title('Potencia: r', 'FontSize', 14); % <-- Ajustado a 14 y sin '(zoom...)'
xlabel('Tiempo [s]', 'FontSize', 12);
ylabel('Potencia', 'FontSize', 12);
ylim([-0.15 0.15]);

% Subplot 3: Cruces por cero 'r' (zoom)
subplot(3,1,3);
plot(t_r(idx_zoom), Z_r(idx_zoom), 'LineWidth', 1.5); % <-- Ajustado a 1.5
title('Cruces por cero: r', 'FontSize', 14); % <-- Ajustado a 14 y sin '(zoom...)'
xlabel('Tiempo [s]', 'FontSize', 12);
ylabel('Tasa de ZCR', 'FontSize', 12);
ylim([-0.15 0.15]);


% --- FIGURA 3: Consonante z (Ajustada a LineWidth 1.5 y Títulos 14) ---
figure('Name', 'Consonante z');
idx_zoom = find(t_z >= 0.95 & t_z <= 1.65);

% Subplot 1: Señal 'z' (zoom)
subplot(3,1,1);
plot(t_z(idx_zoom), z(idx_zoom), 'LineWidth', 1.5); % <-- Ajustado a 1.5
title('Señal: z', 'FontSize', 14); % <-- Ajustado a 14 y sin '(zoom...)'
xlabel('Tiempo [s]', 'FontSize', 12);
ylabel('Amplitud', 'FontSize', 12);
ylim([-1 1]);

% Subplot 2: Potencia 'z' (zoom)
subplot(3,1,2);
plot(t_z(idx_zoom), P_z(idx_zoom), 'LineWidth', 1.5); % <-- Ajustado a 1.5
title('Potencia: z', 'FontSize', 14); % <-- Ajustado a 14 y sin '(zoom...)'
xlabel('Tiempo [s]', 'FontSize', 12);
ylabel('Potencia', 'FontSize', 12);
ylim([-0.15 0.15]);

% Subplot 3: Cruces por cero 'z' (zoom)
subplot(3,1,3);
plot(t_z(idx_zoom), Z_z(idx_zoom), 'LineWidth', 1.5); % <-- Ajustado a 1.5
title('Cruces por cero: z', 'FontSize', 14); % <-- Ajustado a 14 y sin '(zoom...)'
xlabel('Tiempo [s]', 'FontSize', 12);
ylabel('Tasa de ZCR', 'FontSize', 12);
ylim([-0.75 0.75]);


% --- FIGURA 4: Frase completa (Ajustada a LineWidth 1.5 y Títulos 14) ---
figure('Name', 'Frase completa');
idx_zoom = find(t_frase >= 0.45 & t_frase <= 1.85);

% Subplot 1: Señal 'frase' (zoom)
subplot(3,1,1);
plot(t_frase(idx_zoom), frase(idx_zoom), 'LineWidth', 1.5); % <-- Ajustado a 1.5
title('Señal: frase', 'FontSize', 14); % <-- Ajustado a 14 y sin '(zoom...)'
xlabel('Tiempo [s]', 'FontSize', 12);
ylabel('Amplitud', 'FontSize', 12);
ylim([-1 1]);

% Subplot 2: Potencia 'frase' (zoom)
subplot(3,1,2);
plot(t_frase(idx_zoom), P_frase(idx_zoom), 'LineWidth', 1.5); % <-- Ajustado a 1.5
title('Potencia: frase', 'FontSize', 14); % <-- Ajustado a 14 y sin '(zoom...)'
xlabel('Tiempo [s]', 'FontSize', 12);
ylabel('Potencia', 'FontSize', 12);
ylim([-0.15 0.15]);

% Subplot 3: Cruces por cero 'frase' (zoom)
subplot(3,1,3);
plot(t_frase(idx_zoom), Z_frase(idx_zoom), 'LineWidth', 1.5); % <-- Ajustado a 1.5
title('Cruces por cero: frase', 'FontSize', 14); % <-- Ajustado a 14 y sin '(zoom...)'
xlabel('Tiempo [s]', 'FontSize', 12);
ylabel('Tasa de ZCR', 'FontSize', 12);
ylim([-0.6 0.6]);
