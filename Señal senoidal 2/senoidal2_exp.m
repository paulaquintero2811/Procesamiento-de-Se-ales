%% Señal senoidal 2 - Resultados experimentales
clear;
clc;
close all;

%% ===========================
% Lectura del archivo temporal
% ===========================

archivoTiempo = 'datos senoidal 2.csv';

datosTiempo = readcell(archivoTiempo);

inicio = 1;

for i = 1:size(datosTiempo,1)

    if isnumeric(datosTiempo{i,4})

        inicio = i;
        break

    end

end

% Extraer tiempo y voltaje
tiempo = cell2mat(datosTiempo(inicio:end,4));
voltaje = cell2mat(datosTiempo(inicio:end,5));

%% ===========================
% Lectura del archivo FFT
% ===========================

archivoFFT = 'datos FFT SENOIDAL 2.csv';

datosFFT = readcell(archivoFFT);

inicioFFT = 1;

for i = 1:size(datosFFT,1)

    if isnumeric(datosFFT{i,4})

        inicioFFT = i;
        break

    end

end

% Extraer frecuencia y magnitud
frecuencia = cell2mat(datosFFT(inicioFFT:end,4));
magnitud = cell2mat(datosFFT(inicioFFT:end,5));

%% ===========================
% Caracterización instrumental
% ===========================

Ts = tiempo(2)-tiempo(1);     % Tiempo de muestreo
Fs = 1/Ts;                    % Frecuencia de muestreo
N = length(tiempo);           % Número de muestras

%% ===========================
% Pico principal de la FFT
% ===========================

[magnitudMax,indice] = max(magnitud);

frecuenciaPico = frecuencia(indice);

%% ===========================
% Gráficas
% ===========================

figure

subplot(2,1,1)

plot(tiempo,voltaje,'b','LineWidth',1.2)

grid on

xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
title('Señal experimental en el dominio del tiempo')

subplot(2,1,2)

plot(frecuencia,magnitud,'r','LineWidth',1.2)

grid on

xlabel('Frecuencia (Hz)')
ylabel('Magnitud (dB)')
title('FFT experimental')

xlim([0 10000])

