%% Señal Triangular 2 - Grupo 5
clear;
clc;
close all;

%% Parámetros de la señal

Vp = 3;              % Voltaje pico
Vdc = 1.5;           % Componente DC
f0 = 2500;           % Frecuencia fundamental (Hz)
Fs = 2.5e6;          % Frecuencia de muestreo (Hz)

%% Vector de tiempo

t = 0:1/Fs:5/f0;

%% Reconstrucción mediante Serie de Fourier

x = Vdc*ones(size(t));      % Componente continua

% Armónicos impares considerados
n = 1:2:19;

for k = 1:length(n)

    x = x + (8*Vp/((n(k)*pi)^2))*cos(2*pi*n(k)*f0*t);

end

%% ===============================
% Señal en el dominio del tiempo
% ===============================

figure

plot(t,x,'LineWidth',1.5)

grid on

xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
title('Señal triangular 2 reconstruida mediante Serie de Fourier')

xlim([0 5/f0])

%% ======================================
% Armónicos teóricos obtenidos analíticamente
% =======================================

n_arm = [0 1 3 5 7 9];

f_arm = [0 2500 7500 12500 17500 22500];

A_arm = [Vdc ...
    (8*Vp)/((1*pi)^2) ...
    (8*Vp)/((3*pi)^2) ...
    (8*Vp)/((5*pi)^2) ...
    (8*Vp)/((7*pi)^2) ...
    (8*Vp)/((9*pi)^2)];

figure

stem(f_arm,A_arm,'filled','LineWidth',2)

grid on

xlabel('Frecuencia (Hz)')
ylabel('Magnitud (V)')
title('Armónicos teóricos de la señal triangular 2')

xlim([0 25000])

ylim([0 2.6])