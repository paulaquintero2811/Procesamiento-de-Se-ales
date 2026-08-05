%% Señal Triangular 1 - Grupo 5
clear;
clc;
close all;

%% Parámetros de la señal

Vp = 3;                % Voltaje pico (V)
f0 = 2500;             % Frecuencia fundamental (Hz)
Fs = 2.5e6;            % Frecuencia de muestreo (Hz)

%% Vector de tiempo

t = 0:1/Fs:5/f0;       % Cinco periodos

%% Reconstrucción mediante Serie de Fourier

x = zeros(size(t));

% Armónicos impares considerados
n = 1:2:19;

for k = 1:length(n)

    x = x + (8*Vp/((n(k)*pi)^2))*cos(2*pi*n(k)*f0*t);

end

%% ==============================
% Señal en el dominio del tiempo
% ==============================

figure

plot(t,x,'LineWidth',1.5)

grid on

xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
title('Señal triangular reconstruida mediante Serie de Fourier')

xlim([0 5/f0])

%% ==========================================
% Armónicos teóricos obtenidos analíticamente
% ===========================================

n_arm = [1 3 5 7 9];

f_arm = n_arm*f0;

A_arm = (8*Vp)./((n_arm*pi).^2);

figure

stem(f_arm,A_arm,'filled','LineWidth',2)

grid on

xlabel('Frecuencia (Hz)')
ylabel('Magnitud (V)')
title('Armónicos teóricos de la señal triangular 1')

xlim([0 25000])

ylim([0 2.6])

%% Mostrar resultados

disp(' ')

disp('ARMÓNICOS TEÓRICOS')

tabla = table(n_arm',f_arm',A_arm',...
    'VariableNames',{'Armonico','Frecuencia_Hz','Amplitud_Vp'});

disp(tabla)