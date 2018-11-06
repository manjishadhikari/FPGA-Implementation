

for index=1:399,
    acc(index+1) = acc(index) + (inp(index) - sign(acc(index)+eps));
end;

