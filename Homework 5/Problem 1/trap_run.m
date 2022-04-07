%Raiid Ahmed HW5 Problem 1

format long
clc
clear

%loading data

load('accel_data.csv');
accel = accel_data;

%allocating data and initial conditions

time = accel(:,1);

thetadotinit = 0;
phidotinit = 1;
psidotinit = -1;

thetainit = pi/2;
phiinit = pi;
psiinit = pi/4;

l = 1;

thetadotdot = accel(:,2);
phidotdot = accel(:,3);
psidotdot = accel(:,4);

%plotting angular accelerations

figure(1)
    plot(time,accel(:,2))
    grid on
    hold on
        plot(time,accel(:,3))
        plot(time,accel(:,4))
    hold off
    title('Angular Accelerations')
    ylabel('angular accelerations (rad/s^2)')
    xlabel('time(s)')
    legend('$\ddot{\theta}$','$\ddot{\phi}$','$\ddot{\psi}$','Interpreter','latex')
    
%calculating angular velocities
    
thetadot = trap(time,thetadotdot,thetadotinit);
phidot = trap(time,phidotdot,phidotinit);
psidot = trap(time,psidotdot,psidotinit);

%plotting angular velocities

figure(2)
    plot(time,thetadot)
    grid on
    hold on
        plot(time,phidot)
        plot(time,psidot)
    hold off
    title('Angular Velocities')
    ylabel('angular velocities (rad/s)')
    xlabel('time(s)')
    legend('$\dot{\theta}$','$\dot{\phi}$','$\dot{\psi}$','Interpreter','latex')

%calculating angles
    
theta = trap(time,thetadot,thetainit);
phi = trap(time,phidot,phiinit);
psi = trap(time,psidot,psiinit);

%plotting angles

figure(3)
    plot(time,theta)
    grid on
    hold on
        plot(time,phi)
        plot(time,psi)
    hold off
    title('Angles')
    ylabel('angles (rad)')
    xlabel('time(s)')
    legend('${\theta}$','${\phi}$','${\psi}$','Interpreter','latex','Location','southwest')
    
%converting to trajectories
    
thetatraj = [sin(theta),-cos(theta)];
phitraj = [sin(phi),-cos(phi)] + thetatraj;
psitraj = [sin(psi),-cos(psi)] + phitraj;

%plotting trajectories

figure(4)
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

%calculating new trajectories with cumtrapz
    
theta = cumtrapz(time,cumtrapz(time,thetadotdot) + thetadotinit) + thetainit;
phi = cumtrapz(time,cumtrapz(time,phidotdot) + phidotinit) + phiinit;
psi = cumtrapz(time,cumtrapz(time,psidotdot) + psidotinit) + psiinit;

thetatraj = [sin(theta),-cos(theta)];
phitraj = [sin(phi),-cos(phi)] + thetatraj;
psitraj = [sin(psi),-cos(psi)] + phitraj;

%plotting new trajectories

figure(5)
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
    title('Trajectories using trapz')
    xlabel('x(m)')
    ylabel('y(m)')
    legend('path of m_{1}','path of m_{2}','path of m_{3}','start position of m_{1}','start position of m_{2}','start position of m_{3}','final position of m_{1}','final position of m_{2}','final position of m_{3}','Interpreter', 'tex','Location','southwest')  

