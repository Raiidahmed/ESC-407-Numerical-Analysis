
funct = @(x) x^3 - 25;

[a,b,c,d] = bisect(funct,[2,3],1e-4,100);