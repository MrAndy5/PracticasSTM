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

e = e(30970 : 41895);
r = r(37485 : 59535);
z = z(41895 : 72765);
frase = frase(19845 : 81585);

fs = 44100;

% --- FIGURA 1: Vocal e (Formato aplicado) ---
N_e = length(e);
E = fft(e, N_e); % FFT directa
E_pos = abs(E(1:floor(N_e/2))); % Solo parte positiva
f_e = linspace(0, fs/2, floor(N_e/2)); % Eje de frecuencias positivas

figure('Name', 'Espectro y Spectrograma de la vocal e');
subplot(3,1,1);
plot(f_e, 2*E_pos, 'LineWidth', 1.5); % <--- LineWidth 1.5
xlabel('Frecuencia (Hz)', 'FontSize', 12); % <--- FontSize 12
ylabel('Amplitud', 'FontSize', 12); % <--- FontSize 12
title('Espectro de la vocal e (0 a fs/2, sin ventana)', 'FontSize', 14); % <--- FontSize 14
xlim([0 fs/2]);
grid on;

subplot(3,1,2);
plot(f_e, 20*log10(E_pos), 'LineWidth', 1.5); % <--- LineWidth 1.5
xlabel('Frecuencia (Hz)', 'FontSize', 12); % <--- FontSize 12
ylabel('Magnitud (dB)', 'FontSize', 12); % <--- FontSize 12
title('Espectro de la vocal e (0 a fs/2, sin ventana)', 'FontSize', 14); % <--- FontSize 14
xlim([0 fs/2]);
grid on;

subplot(3,1,3);
pspectrum(e, fs, 'spectrogram');
title('Spectrograma de la vocal e', 'FontSize', 14); % <--- FontSize 14
xlabel('Tiempo (s)', 'FontSize', 12); % <--- FontSize 12
ylabel('Frecuencia (kHz)', 'FontSize', 12); % <--- FontSize 12


% --- FIGURA 2: Consonante r (Formato aplicado) ---
N_r = length(r);
R = fft(r, N_r);
R_pos = abs(R(1:floor(N_r/2)));
f_r = linspace(0, fs/2, floor(N_r/2));

figure('Name', 'Espectro y Spectrograma de la consonante r');
subplot(3,1,1);
plot(f_r, 2*R_pos, 'LineWidth', 1.5); % <--- LineWidth 1.5
xlabel('Frecuencia (Hz)', 'FontSize', 12); % <--- FontSize 12
ylabel('Amplitud', 'FontSize', 12); % <--- FontSize 12
title('Espectro de la consonante r (0 a fs/2, sin ventana)', 'FontSize', 14); % <--- FontSize 14
xlim([0 fs/2]);
grid on;

subplot(3,1,2);
plot(f_r, 20*log10(R_pos), 'LineWidth', 1.5); % <--- LineWidth 1.5
xlabel('Frecuencia (Hz)', 'FontSize', 12); % <--- FontSize 12
ylabel('Magnitud (dB)', 'FontSize', 12); % <--- FontSize 12
title('Espectro de la consonante r (0 a fs/2, sin ventana)', 'FontSize', 14); % <--- FontSize 14
xlim([0 fs/2]);
grid on;

subplot(3,1,3);
pspectrum(r, fs, 'spectrogram');
title('Spectrograma de la consonante r', 'FontSize', 14); % <--- FontSize 14
xlabel('Tiempo (s)', 'FontSize', 12); % <--- FontSize 12
ylabel('Frecuencia (kHz)', 'FontSize', 12); % <--- FontSize 12


% --- FIGURA 3: Consonante z (Formato aplicado) ---
N_z = length(z);
Z = fft(z, N_z);
Z_pos = abs(Z(1:floor(N_z/2)));
f_z = linspace(0, fs/2, floor(N_z/2));

figure('Name', 'Espectro y Spectrograma de la consonante z');
subplot(3,1,1);
plot(f_z, 2*Z_pos, 'LineWidth', 1.5); % <--- LineWidth 1.5
xlabel('Frecuencia (Hz)', 'FontSize', 12); % <--- FontSize 12
ylabel('Amplitud', 'FontSize', 12); % <--- FontSize 12
title('Espectro de la consonante z (0 a fs/2, sin ventana)', 'FontSize', 14); % <--- FontSize 14
xlim([0 fs/2]);
grid on;

subplot(3,1,2);
plot(f_z, 20*log10(Z_pos), 'LineWidth', 1.5); % <--- LineWidth 1.5
xlabel('Frecuencia (Hz)', 'FontSize', 12); % <--- FontSize 12
ylabel('Magnitud (dB)', 'FontSize', 12); % <--- FontSize 12
title('Espectro de la consonante z (0 a fs/2, sin ventana)', 'FontSize', 14); % <--- FontSize 14
xlim([0 fs/2]);
grid on;

subplot(3,1,3);
pspectrum(z, fs, 'spectrogram');
title('Spectrograma de la consonante z', 'FontSize', 14); % <--- FontSize 14
xlabel('Tiempo (s)', 'FontSize', 12); % <--- FontSize 12
ylabel('Frecuencia (kHz)', 'FontSize', 12); % <--- FontSize 12


% --- FIGURA 4: Frase completa (Formato aplicado) ---
N_frase = length(frase);
F = fft(frase, N_frase);
F_pos = abs(F(1:floor(N_frase/2)));
f_frase = linspace(0, fs/2, floor(N_frase/2));

figure('Name', 'Espectro y Spectrograma de la frase');
subplot(3,1,1);
plot(f_frase, 2*F_pos, 'LineWidth', 1.5); % <--- LineWidth 1.5
xlabel('Frecuencia (Hz)', 'FontSize', 12); % <--- FontSize 12
ylabel('Amplitud', 'FontSize', 12); % <--- FontSize 12
title('Espectro de la frase (0 a fs/2, sin ventana)', 'FontSize', 14); % <--- FontSize 14
xlim([0 fs/2]);
grid on;

subplot(3,1,2);
plot(f_frase, 20*log10(F_pos), 'LineWidth', 1.5); % <--- LineWidth 1.5
xlabel('Frecuencia (Hz)', 'FontSize', 12); % <--- FontSize 12
ylabel('Magnitud (dB)', 'FontSize', 12); % <--- FontSize 12
title('Espectro de la frase (0 a fs/2, sin ventana)', 'FontSize', 14); % <--- FontSize 14
xlim([0 fs/2]);
grid on;

subplot(3,1,3);
pspectrum(frase, fs, 'spectrogram');
title('Spectrograma de la frase', 'FontSize', 14); % <--- FontSize 14
xlabel('Tiempo (s)', 'FontSize', 12); % <--- FontSize 12
ylabel('Frecuencia (kHz)', 'FontSize', 12); % <--- FontSize 12
