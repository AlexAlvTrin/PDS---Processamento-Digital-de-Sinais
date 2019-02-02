
fs =12000; % Freq./
Ts = 1/fs; %Período de amostragem (Hz)
fc = 4000; N =1; % Frequência de corte e Ordem
t = 0:Ts:0.05; % Tempo de exibição do sinal
x = sawtooth(2*pi*400*t,0.5); % sinal composto a ser filtrado
plot(t,x),title('Entrada'),xlabel('tempo (s)'),ylabel('amplit.'),hold on

%tipo de filtro
[z,p,k] = butter(N,fc/(fs),'high');
% [z,p,k] = cheby1(N,3,fc/fs,'high');
% [z,p,k] = cheby2(N,3,fc/fs,'high');

[B,A] = zp2tf(z,p,k);

y = filter(B,A,x); % filtragem do sinal 'x'
plot(t,y,'k','linewidth',2) 
title('Sinal Filtrado'), xlabel('tempo (s)'), ylabel('amplitude')


f = 0:1:5000; w = 2*pi*f; % faixa de freq. desejada (Hz
z = exp(j*w*Ts);
H = (B(1)+B(2)*z.^(-1))./(A(1)+A(2)*z.^(-1));
figure, plot(f,abs(H)), grid
title('Resposta em freq.'), xlabel('frequênca (Hz)'), ylabel('amplitude')