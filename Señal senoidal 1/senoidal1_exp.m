%% Lectura y graficación de datos experimentales
clear;
clc;
close all;

%% ===========================
%  Lectura del archivo temporal
% ============================

archivoTiempo = 'datos senoidal 1.csv';

% Leer todo el archivo
datosTiempo = readcell(archivoTiempo);

% Buscar dónde comienzan los datos numéricos
inicio = 1;

for i = 1:size(datosTiempo,1)

    if isnumeric(datosTiempo{i,4})

        inicio = i;
        break

    end

end

% Extraer tiempo y amplitud
tiempo = cell2mat(datosTiempo(inicio:end,4));
voltaje = cell2mat(datosTiempo(inicio:end,5));

%% ===========================
%  Lectura del archivo FFT
% ============================

archivoFFT = 'datos FFT senoidal 1.csv';

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

%% ===========================
%        Gráficas
% ============================

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

xlim([0 15000])