% Function to calculate the factorial of a number 

function f=fact(n) 
 
% Initialize the output 
  f=1; 
  n=5;
% Check whether the input is correct 
  if((n<0)||(rem(n,1)~=0)) 
    disp('Entered number is a negative number. Exit \n'); 
    return 
  end 
 
  for num=1:n 
    f=f*num; 
  end 
 
end