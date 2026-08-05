%% Señal Pulso 2 - Grupo 5
clear;
clc;
close all;

%% Parámetros de la señal

Vp = 3;              % Voltaje pico (V)
f0 = 2500;           % Frecuencia fundamental (Hz)
Fs = 2.5e6;          % Frecuencia de muestreo (Hz)
duty = 20;           % Ciclo útil (%)

%% Tiempo

T = 1/f0;
t = 0:1/Fs:5*T;

%% Señal de pulso

x = Vp*square(2*pi*f0*t,duty);

%% FFT

N = length(x);

X = fft(x);

P2 = abs(X)/N;

P1 = P2(1:floor(N/2)+1);

P1(2:end-1)=2*P1(2:end-1);

f = Fs*(0:floor(N/2))/N;

%% Señal en el dominio del tiempo

figure

plot(t,x,'LineWidth',1.5)

grid on

xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
title('Señal de pulso 2 en el dominio del tiempo')

xlim([0 5*T])

ylim([-3.5 3.5])

%% Espectro teórico

figure

stem(f,P1,'filled','LineWidth',1.5)

grid on

xlabel('Frecuencia (Hz)')
ylabel('Magnitud (V)')
title('FFT teórica del pulso 2')

xlim([0 25000])

ylim([0 2.5])