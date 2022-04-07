%Homework 6 Raiid Ahmed

function [position,isterminal,direction] = endevent(t,y)

    position = abs(y(5)) - 2*pi; % The value that we want to be zero
    isterminal = 1;  % Halt integration 
    direction = 0;   % The zero can be approached from either direction
end