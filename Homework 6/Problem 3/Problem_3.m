%Homework 6 Problem 3 Raiid Ahmed

clc
clear

%Allocate variable, constants, parameters, and indices

syms x(t) 

delta = .3;
alpha = -1;
beta = 1;
omega = 1.2;
tau = (2*pi)/omega;
tspan = [0 200];
y0 = [1 0];
h = tau/1000;
startpoint = round(40/h);
multiple_indices = 40:h:tspan(2);
multiple_indices = round(multiple_indices(mod(multiple_indices,tau) < .005)/h);

%Period-1 Oscillation

gamma = .2;

duff = diff(x,2) + delta*diff(x,1) + alpha*x + beta*(x^3) == gamma*cos(omega*t);

[V,S] = odeToVectorField(duff);

funct = matlabFunction(V,'vars',{'t','Y'});

[t1,y1] = rk4(funct,tspan,y0,h);

figure
    subplot(2,2,1)
        plot(t1,y1(1,:))
            title('Period-1 t vs x')
            xlabel('t')
            ylabel('x')
    subplot(2,2,2)
        plot(y1(2,startpoint:length(y1(2,:))),y1(1,startpoint:length(y1(1,:))))
            title('Phase Space')
            xlabel('xdot')
            ylabel('x')
            xlim([min(y1(2,:)) max(y1(2,:))])
            ylim([min(y1(1,:)) max(y1(1,:))])
    subplot(2,2,3)
        scatter(y1(2,multiple_indices),y1(1,multiple_indices))
            title('Poincare Map')
            xlabel('xdot')
            ylabel('x')
    
%Weak Period-2 Oscillation
    
gamma = .28;

duff = diff(x,2) + delta*diff(x,1) + alpha*x + beta*(x^3) == gamma*cos(omega*t);

[V,S] = odeToVectorField(duff);

funct = matlabFunction(V,'vars',{'t','Y'});

[t2,y2] = rk4(funct,tspan,y0,h);

figure
    subplot(2,2,1)
        plot(t2,y2(1,:))
            title('Weak Period-2 t vs x')
            xlabel('t')
            ylabel('x')
    subplot(2,2,2)
        plot(y2(2,startpoint:length(y2(2,:))),y2(1,startpoint:length(y2(1,:))))
            title('Phase Space')
            xlabel('xdot')
            ylabel('x')
            xlim([min(y2(2,:)) max(y2(2,:))])
            ylim([min(y2(1,:)) max(y2(1,:))])
    subplot(2,2,3)
        scatter(y2(2,multiple_indices),y2(1,multiple_indices))
            title('Poincare Map')
            xlabel('xdot')
            ylabel('x')
    
%Strong Period-2 Oscillation
    
gamma = .65;

duff = diff(x,2) + delta*diff(x,1) + alpha*x + beta*(x^3) == gamma*cos(omega*t);

[V,S] = odeToVectorField(duff);

funct = matlabFunction(V,'vars',{'t','Y'});

[t3,y3] = rk4(funct,tspan,y0,h);

figure
    subplot(2,2,1)
        plot(t3,y3(1,:))
            title('Strong Period-2 t vs x')
            xlabel('t')
            ylabel('x')
    subplot(2,2,2)
        plot(y3(2,startpoint:length(y3(2,:))),y3(1,startpoint:length(y3(1,:))))
            title('Phase Space')
            xlabel('xdot')
            ylabel('x')
            xlim([min(y3(2,:)) max(y3(2,:))])
            ylim([min(y3(1,:)) max(y3(1,:))])
    subplot(2,2,3)
        scatter(y3(2,multiple_indices),y3(1,multiple_indices))
            title('Poincare Map')
            xlabel('xdot')
            ylabel('x')

%Period-4 Oscillation
    
gamma = .29;

duff = diff(x,2) + delta*diff(x,1) + alpha*x + beta*(x^3) == gamma*cos(omega*t);

[V,S] = odeToVectorField(duff);

funct = matlabFunction(V,'vars',{'t','Y'});

[t4,y4] = rk4(funct,tspan,y0,h);

figure
    subplot(2,2,1)
        plot(t4,y4(1,:))   
            title('Period-4 Oscillation t vs x')
            xlabel('t')
            ylabel('x')
    subplot(2,2,2)
        plot(y4(2,startpoint:length(y4(2,:))),y4(1,startpoint:length(y4(1,:))))
            title('Phase Space')
            xlabel('xdot')
            ylabel('x')
            xlim([min(y4(2,:)) max(y4(2,:))])
            ylim([min(y4(1,:)) max(y4(1,:))])
    subplot(2,2,3)
        scatter(y4(2,multiple_indices),y4(1,multiple_indices))
            title('Poincare Map')
            xlabel('xdot')
            ylabel('x')
    
%Period-5 Oscillation
    
gamma = .37;

duff = diff(x,2) + delta*diff(x,1) + alpha*x + beta*(x^3) == gamma*cos(omega*t);

[V,S] = odeToVectorField(duff);

funct = matlabFunction(V,'vars',{'t','Y'});

[t5,y5] = rk4(funct,tspan,y0,h);

figure
    subplot(2,2,1)
        plot(t5,y5(1,:))
            title('Period-5 t vs x')
            xlabel('t')
            ylabel('x')
    subplot(2,2,2)
        plot(y5(2,startpoint:length(y5(2,:))),y5(1,startpoint:length(y5(1,:))))
            title('Phase Space')
            xlabel('xdot')
            ylabel('x')
            xlim([min(y5(2,:)) max(y5(2,:))])
            ylim([min(y5(1,:)) max(y5(1,:))])
    subplot(2,2,3)
        scatter(y5(2,multiple_indices),y5(1,multiple_indices))
            title('Poincare Map')
            xlabel('xdot')
            ylabel('x')
 
%Chaos
    
gamma = .5;
tspan(2) = 20000;
stoppoint = round(250/h);
multiple_indices = 40:h:tspan(2);
multiple_indices_g = multiple_indices(mod(multiple_indices,tau) < .005);
multiple_indices = round(multiple_indices(mod(multiple_indices,tau) < .005)/h);

duff = diff(x,2) + delta*diff(x,1) + alpha*x + beta*(x^3) == gamma*cos(omega*t);

[V,S] = odeToVectorField(duff);

funct = matlabFunction(V,'vars',{'t','Y'});

[t6,y6] = rk4(funct,tspan,y0,h);

figure
    subplot(2,2,1)
        plot(t6(1:stoppoint),y6(1,1:stoppoint))
            title('Chaos t vs x')
            xlabel('t')
            ylabel('x')
            xlim([0 250])
    subplot(2,2,2)    
        plot(y6(2,startpoint:stoppoint),y6(1,startpoint:stoppoint))
            title('Phase Space')
            xlabel('xdot')
            ylabel('x')
            xlim([min(y6(2,:)) max(y6(2,:))])
            ylim([min(y6(1,:)) max(y6(1,:))])
    subplot(2,2,3)
        scatter(y6(2,multiple_indices),y6(1,multiple_indices))
            title('Poincare Map')
            xlabel('xdot')
            ylabel('x')
            
%Create flow map

figure
    for n = 1:20
        multiple_indices = round((multiple_indices_g + (tau/n))/h);
        multiple_indices = multiple_indices(1:length(multiple_indices)-1);
        subplot(4,5,n)
            scatter(y6(2,multiple_indices),y6(1,multiple_indices),'.')
                title("n = " + n)
                xlabel('xdot')
                ylabel('x')
    end
    
%Record movie
    
figure(99)
    for n = 1:40
       multiple_indices = round((multiple_indices_g + (tau/(n+1)))/h);
       multiple_indices = multiple_indices(1:length(multiple_indices)-1);
       scatter(y6(2,multiple_indices),y6(1,multiple_indices))
           title('Poincare Flow')
           xlabel('xdot')
           ylabel('x')
       frame = getframe(99);
       movframes(:,:,:,n) = frame.cdata;
    end

%Watch movie pls

mov = immovie(movframes);
implay(mov)
    
    
    
    
