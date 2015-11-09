steps = 25;
step = 0.1;
hit = 10;
s = 0 : 0.1 : steps;
y = arrayfun(@prob, hit, s);
plot(s,y);
sum(y) * step