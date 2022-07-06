%To find the diagonal and off diagonal elements of a matrix 
A = [5 2 9; 14 6 7; 4 6 25];
k=diag(A); % Diagonal elements

g= diag(fliplr(A)); % Off diagonal elements

disp(g);

disp(k);

%o/p:  9
%      6
%      4

%o/p 5
%    6
%   25 
