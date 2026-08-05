%% Señal Cuadrada 2 - Grupo 5
clear;
clc;
close all;

%% Parámetros de la señal

Vp = 3;              % Voltaje pico (V)
DC = 1.25;           % Componente continua (V)
f0 = 2500;           % Frecuencia fundamental (Hz)
Fs = 2.5e6;          % Frecuencia de muestreo (Hz)

%% Tiempo

T = 1/f0;
t = 0:1/Fs:5*T;      % Cinco periodos

%% Señal cuadrada

x = DC + Vp*square(2*pi*f0*t,50);

%% FFT

N = length(x);

X = fft(x);

P2 = abs(X)/N;

P1 = P2(1:floor(N/2)+1);

P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:floor(N/2))/N;

%% ==========================
%% Señal en el dominio del tiempo
%% ==========================

figure

plot(t,x,'LineWidth',1.5)

grid on

xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
title('Señal cuadrada 2 en el dominio del tiempo')

xlim([0 5*T])

%% ==========================
%% FFT teórica
%% ==========================

figure

stem(f,P1,'filled','LineWidth',1.5)

grid on

xlabel('Frecuencia (Hz)')
ylabel('Magnitud (V)')
title('FFT teórica de la señal cuadrada 2')

xlim([0 25000])

ylim([0 4.2])