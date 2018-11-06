freq=[4];

for i=1:size(freq,2)
timeperiod(i)=1/freq(i);
rate_time(i)=timeperiod(i)/64;
ratefreq(i)=1/rate_time(i);
steps(i)= round(rate_time(i)/(10^-8));

end

% steps=[47 42 37 35 31 28 25 23 21 19 18 16 14 12 11];
% 
% for k=1:size(steps,2)
%    rate_timeafter(k)=steps(k) *10^-8;
%   
%    time_after(k)=rate_timeafter(k)*16384;
%    freq_after(k)=1/time_after(k);
%    error(k)=freq(k)-freq_after(k);
% end
