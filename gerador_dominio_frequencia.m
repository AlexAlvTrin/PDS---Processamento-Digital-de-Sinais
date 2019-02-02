

fs =12000; % Freq./
Ts = 1/fs; %Período de amostragem (Hz)
fc = 4000; N =1; % Frequência de corte e Ordem
t = 0:Ts:0.05; % Tempo de exibição do sinal
x = sawtooth(2*pi*400*t,0.5); % sinal composto a ser filtrado
plot_hz(x,fs,1024,'nao'); title('FFT do sinal de entrada'),ylabel('Amplitude'),figure
[z,p,k] = cheby2(N,3,fc/fs,'high');
[B,A] = zp2tf(z,p,k);
y = filter(B,A,x); % filtragem do sinal 'x'

plot_hz(y,fs,1024,'nao'); title('FFT do sinal filtrado'),ylabel('Amplitude')








