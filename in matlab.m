%k?r?m Filtresi ve alt ?rnekleme
t=-10:1/100:10;
Ts=1/6;
ts=-10:Ts:10;
n=ts./Ts;
xn=(sinc(ts)).^2;

M=4;
w=linspace(-10*pi,10*pi,length(t));
xsw=zeros(1,length(w));
for k=1:length(w)
    xsw(k)=sum(xn.*exp(-j.*w(k).*n));
end
figure(1)
subplot(3,2,1)
plot(w,abs(xsw))
title('sinc^2 nin fourierr d?n???m?')
subplot(3,2,2)
for k=0:M-1;
plot(M*w-2*pi*k,abs(xsw)/M)
hold on
end
title('M=4 ile ?rneklenmi? sinc^2 nin fourier d?n???m?')

%k?r?m filtresi
hdn=(1/M)*sinc(n./M);
subplot(3,2,3)
stem(n,hdn)
%?imdi kr??m filtresinin fourier d?n??m?n? 
hdw=zeros(1,length(w));
for h=1:length(w)
    hdw(h)=sum(hdn.*exp(-j.*w(h).*n));
end
subplot(3,2,4)
plot(w,abs(hdw))
title('spektral d?zlemde k?r?m filtresi')
xlim([-10*pi 10*pi])

Hdxw=hdw.*xsw;
subplot(3,2,5)
plot(w,abs(Hdxw))
title('spektral d?zleminde filrtrelenmi? sinyal')
xlim([-3*pi 3*pi])

subplot(3,2,6)
for k=0:M-1;
    plot(M*w-2*pi*k,abs(Hdxw)/M)
end
title('filtrelenmi? M=4 ile ?rneklenmi? Sinc^2')
xlim([-10*pi 10*pi])