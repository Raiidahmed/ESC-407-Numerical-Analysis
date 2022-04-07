% Homework 6 Raiid Ahmed Problem 2

clc
clear

%Allocate variables

syms theta(t) phi(t) psi(t)

%Allocate constants

l = 1;
m1 = 3;
m2 = 2;
m3 = 1;
g = 9.81;

%Allocate equations of motion

eqn1 = (m1*l + m2*l + m3*l)*diff(theta,2) + (m2 + m3)*l*cos(theta - phi)*diff(phi,2) + m3*l*cos(theta - psi)*diff(psi,2) + (m2 + m3)*l*sin(theta - phi)*(diff(phi,1)^2) + m3*l*sin(theta - psi)*(diff(psi,1)^2) + (m1 + m2 + m3)*g*sin(theta) == 0;
eqn2 = (m2 + m3)*l*cos(theta - phi)*diff(theta,2) + (m2 + m3)*l*diff(phi,2) + m3*l*cos(phi - psi)*diff(psi,2) - (m2 + m3)*l*sin(theta - phi)*(diff(theta,1)^2) + m3*l*sin(phi - psi)*(diff(psi,1)^2) + (m2 + m3)*g*sin(phi) == 0;
eqn3 = l*cos(theta - psi)*diff(theta,2) + l*cos(phi - psi)*diff(phi,2) + l*diff(psi,2) - l*sin(theta - psi)*(diff(theta,1)^2) - l*sin(phi - psi)*(diff(phi,1)^2) + g*sin(psi) == 0;

eqns = [eqn1 eqn2 eqn3];

%Convert to system of 1d equations

[V,S] = odeToVectorField(eqns);

functs = matlabFunction(V,'vars',{'t','Y'});

%Allocate parameters

y0 = [pi, 1, pi/2, 0, pi/4, -1];
tspan = [0 10];
h1 = .00001;
h2 = .001;
hmin = .001;
hmax = .0275;
tol = 1.135e-8;

%Calculates solutions

[t1,y1] = heun(functs,tspan,y0,h1);
[t2,y2] = rk4(functs,tspan,y0,h2);
[t3,y3,h] = rk45(functs,tspan,y0,tol,hmax,hmin);

%Plotting solutions

figure
    hold on
        plot(t2,y2(1,:))
        plot(t2,y2(3,:))
        plot(t2,y2(5,:))
        
        plot(t1,y1(1,:),'--')
        plot(t1,y1(3,:),'--')
        plot(t1,y1(5,:),'--')
        
        plot(t3,y3(1,:),':')
        plot(t3,y3(3,:),':')
        plot(t3,y3(5,:),':')
            title('Angles')
            ylabel('angles')
            xlabel('time')
            legend('rk4 ${\phi}$','rk4 ${\theta}$','rk4 ${\psi}$','heun ${\phi}$','heun ${\theta}$','heun ${\psi}$','rkf ${\phi}$','rkf ${\theta}$','rkf ${\psi}$','Interpreter','latex')

figure
    hold on
        plot(t2,y2(2,:))
        plot(t2,y2(4,:))
        plot(t2,y2(6,:))
        
        plot(t1,y1(2,:),'--')
        plot(t1,y1(4,:),'--')
        plot(t1,y1(6,:),'--')
        
        plot(t3,y3(2,:),':')
        plot(t3,y3(4,:),':')
        plot(t3,y3(6,:),':')
            title('Velocities')
            ylabel('angular velocity')
            xlabel('time')
            legend('rk4 $\dot{\phi}$','rk4 $\dot{\theta}$','rk4 $\dot{\psi}$','heun $\dot{\phi}$','heun $\dot{\theta}$','heun $\dot{\psi}$','rkf $\dot{\phi}$','rkf $\dot{\theta}$','rkf $\dot{\psi}$','Interpreter','latex')

%Plotting t vs h for rk45
            
figure
    plot(t3,h)
        title('Step-Size for Runge Kutta Fehlberg')
        xlabel('time')
        ylabel('step-size')
    
%Calculating trajectories
        
thetatraj = [sin(y2(3,:).'),-cos(y2(3,:).')];
phitraj = [sin(y2(1,:).'),-cos(y2(1,:).')] + thetatraj;
psitraj = [sin(y2(5,:).'),-cos(y2(5,:).')] + phitraj;

%Plotting trajectories

figure
    plot(thetatraj(:,1),thetatraj(:,2))
    grid on
    hold on
        plot(phitraj(:,1),phitraj(:,2),'color',[0.8500, 0.3250, 0.0980])
        plot(psitraj(:,1),psitraj(:,2),'color',[0.9290, 0.6940, 0.1250])
        
        plot(thetatraj(1,1),thetatraj(1,2),'o','MarkerSize',5,'MarkerEdgeColor','red')
        plot(phitraj(1,1),phitraj(1,2),'o','MarkerSize',5,'MarkerEdgeColor','green')
        plot(psitraj(1,1),psitraj(1,2),'o','MarkerSize',5,'MarkerEdgeColor','blue')
        
        plot(thetatraj(length(thetatraj(:,1)),1),thetatraj(length(thetatraj(:,2)),2),'.','MarkerSize',15,'MarkerEdgeColor','red')
        plot(phitraj(length(phitraj(:,1)),1),phitraj(length(phitraj(:,2)),2),'.','MarkerSize',15,'MarkerEdgeColor','green')
        plot(psitraj(length(psitraj(:,1)),1),psitraj(length(psitraj(:,2)),2),'.','MarkerSize',15,'MarkerEdgeColor','blue') 
    hold off
    title('Trajectories')
    xlabel('x(m)')
    ylabel('y(m)')
    legend('path of m_{1}','path of m_{2}','path of m_{3}','start position of m_{1}','start position of m_{2}','start position of m_{3}','final position of m_{1}','final position of m_{2}','final position of m_{3}','Interpreter', 'tex','Location','southwest')  

%Setting up parameters    
    
solvepi = inf;
hpi = 1e-5;
tpi = hpi;
y0pi = y0;

%Calculating t at psi = 2pi

while abs(solvepi - 2*pi) >= 1e-5
    tpi = tpi + hpi;
    tspanpi = [tpi - hpi, tpi];
    [t,y] = rk4(functs,tspanpi,y0pi,hpi);
    solvepi = abs(y(5,length(y(5,:))));
    y0pi = y(:,length(y(1,:)));
end

%displaying results for rk4

disp('rk4 method:')
disp("psi = 2*pi at t = " + tpi)
disp("at t = " + tpi + " theta = " + y(3,length(y(3,:))))
disp("at t = " + tpi + " phi = " + y(1,length(y(1,:))))
disp("at t = " + tpi + " psidot = " + y(6,length(y(6,:))))
disp("at t = " + tpi + " thetadot = " + y(4,length(y(4,:))))
disp("at t = " + tpi + " phidot = " + y(2,length(y(2,:))))
disp(' ')

%Calculating using events and ode45

opts = odeset('Events',@endevent,'RelTol',1e-8,'AbsTol',1e-10);
[t,y,te,ye] = ode45(functs,[0 10],y0,opts);

%displaying results for ode45

disp('ode45 method:')
disp("psi = 2*pi at t = " + te)
disp("at t = " + te + " theta = " + ye(3))
disp("at t = " + te + " phi = " + ye(1))
disp("at t = " + te + " psidot = " + ye(6))
disp("at t = " + te + " thetadot = " + ye(4))
disp("at t = " + te + " phidot = " + ye(2))
disp(' ')




