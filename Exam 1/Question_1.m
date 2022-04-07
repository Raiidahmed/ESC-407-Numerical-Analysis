clc
clear

syms x s real

funct2 = ((((4*exp(s^2))*((8*(s^6)) + (60*(s^4)) + (90*(s^2)) + 15)))/120)*(x^5);

int(funct2,x)

funct3 = @(s) s^6*(exp(s^2)/12 + (s^2*exp(s^2))/2 + (s^4*exp(s^2))/3 + (2*s^6*exp(s^2))/45);
funct3(.4) 

