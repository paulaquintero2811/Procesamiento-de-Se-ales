%% Señal senoidal 2 - Grupo 5
clear;
clc;
close all;

%% Parámetros de la señal
DC = 1;            % Componente DC (V)
Vp = 3;            % Voltaje pico (V)
f0 = 2500;         % Frecuencia fundamental (Hz)
Fs = 2.5e6;        % Frecuencia de muestreo (Hz)
T0 = 1/f0;         % Período de la señal

%% Vector de tiempo
t = 0:1/Fs:5*T0;   % Se generan cinco períodos

%% Construcción de la señal
x = DC + Vp*sin(2*pi*f0*t);

%% Cálculo de la FFT
N = length(x);

X = fft(x);

% Espectro de dos lados
P2 = abs(X)/N;

% Espectro de un solo lado
P1 = P2(1:floor(N/2)+1);

% Se duplican las componentes excepto DC y Nyquist
P1(2:end-1) = 2*P1(2:end-1);

% Conversión a decibeles
P1_dB = 20*log10(P1 + eps);

% Vector de frecuencias
f = Fs*(0:floor(N/2))/N;

%% Gráficas

figure

%-----------------------------
% Señal en el dominio del tiempo
%-----------------------------
subplot(2,1,1)

plot(t,x,'LineWidth',1.5)

grid on

xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
title('Señal senoidal 2 en el dominio del tiempo')

ylim([-2.5 4.5])

%-----------------------------
% FFT de la señal
%-----------------------------
subplot(2,1,2)

stem(f,P1,'filled')

grid on

xlabel('Frecuencia (Hz)')
ylabel('Magnitud (V)')
title('Espectro teórico de la señal')

xlim([0 10000])
ylim([0 3.5])