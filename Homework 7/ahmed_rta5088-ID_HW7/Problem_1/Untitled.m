clc
clear

n = 3;
A = [3,8,1;
    -4,1,1;
    -4,1,1];
% A(end+1,:) = A(1,:)*4;
%b = rand(n,1);

% A = rand(n).* 4;

%A = rand(n);

% A(3,:)./A(1,:);

% for i = 1:n-1
%     xMultiplier = A(i+1:n,i) / A(i,i);
%     A(i+1:n,:) - xMultiplier * A(i,:)
% end

rref(A)

