inp = sin(2*pi*(1:400)/150); %+/- 1
acc = zeros(1,400);
cmp = zeros(1,400);

for index=1:399,
    acc(index+1) = acc(index) + (inp(index) - sign(acc(index)+eps));
end;

out = interp1((1:400),double(acc > 0),(1:.01:400),'nearest');

figure(1); clf;
plot(out); set(gca,'yLim',[-.1,1.1]);
