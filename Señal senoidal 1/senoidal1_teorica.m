%% Señal senoidal 1 - Grupo 5
clear;
clc;
close all;

%% Parámetros de la señal
Vp = 3;              % Voltaje pico (V)
f0 = 2500;           % Frecuencia fundamental (Hz)
Fs = 2.5e6;          % Frecuencia de muestreo (Hz)
T0 = 1/f0;           % Período de la señal

%% Vector de tiempo
t = 0:1/Fs:5*T0;     % Se generan cinco períodos

%% Señal senoidal
x = Vp*sin(2*pi*f0*t);

%% Cálculo de la FFT
N = length(x);        % Número de muestras

X = fft(x);           % Transformada de Fourier

% Espectro de dos lados
P2 = abs(X)/N;

% Espectro de un solo lado
P1 = P2(1:floor(N/2)+1);

% Se duplican las componentes excepto DC y Nyquist
P1(2:end-1) = 2*P1(2:end-1);

% Vector de frecuencias
f = Fs*(0:floor(N/2))/N;

%% Gráficas

figure

% Señal en el dominio del tiempo
subplot(2,1,1)
plot(t,x,'LineWidth',1.5)
grid on
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
title('Señal senoidal en el dominio del tiempo')

% Espectro de magnitud
subplot(2,1,2)
stem(f,P1,'filled')
grid on
xlim([0 10000])              % Mostrar hasta 10 kHz
ylim([0 3.5])                % Para visualizar el pico de 3 V
xlabel('Frecuencia (Hz)')
ylabel('Magnitud (V)')
title('Espectro de magnitud (FFT)')  