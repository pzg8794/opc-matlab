%Piter Garcia
%Square Wave = Sum of N Harmonics
%Plot of Individual Harmonics and 1khz Square Wave
%LabNo.37
clf

N=input('N= ');
w= 2*pi*1000;
t=0:1e-6:1e-3
for n=1:2:N
    vn=(8./pi)*sin(n*w*t)*(sin(n*pi./2)./(4-n^2));
    plot(t,vn)
    hold on
    if n==1
        v=vn;
    else
        v=vn+v;
    end
end
plot(t,v, 'LineWidth', 1.5)
grid on
plot([0, 0.001],[0, 0])

xlabel('TIME IN SECONDS')
title('Synthesizing a 1khz Square Wave')
text(0.62e-3, 1.2, ['Up to Harmonic # ', num2str(N)])
hold on