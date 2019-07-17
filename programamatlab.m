clear all%LIMPIAR WORKSPACE(VARIABLES)
close all % CERRAR VENTANAS
clc %LIMPIAR VENTANA DE COMANDO
 %----------------------
F1=100;
F2=3000;
tf=0.1;%TIEMPO FINAL
t=linspace(0,tf,2000);%VECTOR TIEMPO
M=length(t);%CANTIDA DE PUN TOS
duracion=tf;%DURACION DE LA SEÑAL
%FRECUENCIA DE MUESTREO
Fs=M/duracion;
%CREAR SEÑALES 
s1=sin(2*pi*F1*t);
s2=sin(2*pi*F2*t);
st=s1+s2;%ONDA RESULTANTE
%ESPECTRO EN FRECUENCIA
Tf1=fft(st);
%MAGNITUD
Tf1=abs(Tf1);
%CANTIDAD DE MUESTRAS
N=length(Tf1);
%DEFINIR VECTOR DE FRECUENCIA
F=linspace(0,Fs,N);
subplot(311)
plot(F(1:N/2),Tf1(1:N/2))
title('TF(st)')
xlabel('HERTZ')
ylabel('MAGNITUD')
%--------DEFINIR EL SISTEMA RC--------------------
R=10;%10 OHM
C=100/(1000000);%100uf
%NUM
b=[0 1];
%DEN
a=[R*C 1];
%RESPUESTA EN FRECUENCIA (tiempo(continuo ))
H=freqs(b,a,2*pi*F);
%MAGNITUD
H_mag=abs(H);
subplot(312)
plot(F(1:N/2),H_mag(1:N/2))
title('RESPUESTA EN FRECUENCIA (CIRCUITO RC)')
ylabel('MAGNITUD')
xlabel('HERTZ')
%-----------------------------
%SALIDA
subplot(313)
Yf=Tf1.*H_mag;
plot(F(1:N/2),Yf(1:N/2))
title('ESPECTRO DE FRECUENCIA DE LA SALIDA')
ylabel('MAGNITUD')
xlabel('HERTZ')