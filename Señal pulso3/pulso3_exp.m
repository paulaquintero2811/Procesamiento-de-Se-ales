%% Señal Pulso 3 - Resultados experimentales
clear;
clc;
close all;

%% ==========================
% Lectura de la señal temporal
%% ==========================

archivoTiempo = 'DATOS PULSO 3.csv';

datos = readcell(archivoTiempo);

inicio = 1;

for i = 1:size(datos,1)

    if isnumeric(datos{i,4})

        inicio = i;
        break

    end

end

tiempo = cell2mat(datos(inicio:end,4));
voltaje = cell2mat(datos(inicio:end,5));

%% Eliminar datos no válidos

idx = isfinite(tiempo) & isfinite(voltaje);

tiempo = tiempo(idx);
voltaje = voltaje(idx);

%% ==========================
% Lectura de la FFT
%% ==========================

archivoFFT = 'DATOS PULSO 3 FFT.csv';

datosFFT = readcell(archivoFFT);

inicioFFT = 1;

for i = 1:size(datosFFT,1)

    if isnumeric(datosFFT{i,4})

        inicioFFT = i;
        break

    end

end

frecuencia = cell2mat(datosFFT(inicioFFT:end,4));
magnitud = cell2mat(datosFFT(inicioFFT:end,5));

%% Eliminar datos no válidos

idx = isfinite(frecuencia) & isfinite(magnitud);

frecuencia = frecuencia(idx);
magnitud = magnitud(idx);

%% ==========================
% Caracterización instrumental
%% ==========================

Ts = tiempo(2)-tiempo(1);
Fs = 1/Ts;

%% ==========================
% Señal experimental
%% ==========================

figure

plot(tiempo,voltaje,'b','LineWidth',1.3)

grid on

xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
title('Señal de pulso 3 experimental')

%% ==========================
% FFT experimental
%% ==========================

figure

plot(frecuencia,magnitud,'r','LineWidth',1.3)

grid on

xlabel('Frecuencia (Hz)')
ylabel('Magnitud (dB)')
title('FFT experimental del pulso 3')

xlim([0 25000])

%% ==========================
% Armónicos teóricos
%% ==========================

armonicos = [0 2500 5000 7500 10000 12500 15000 17500 20000 22500];

indices = zeros(size(armonicos));

for k = 1:length(armonicos)

    [~,indices(k)] = min(abs(frecuencia-armonicos(k)));

end

%% Valores experimentales

frecuencia_exp = frecuencia(indices);
magnitud_exp = magnitud(indices);
