!Calculate the area of a triangle using Heron formula

program Heron_Triangle_Area

IMPLICIT NONE

!Declare variables and theta
REAL :: a = 10 ,b = 10, c, s, area, x
REAL :: theta = 60

x = 3.14*theta/180 ! Convert into radian
c = sqrt(a**2+b**2-2*a*b*cos(x))
s =(a+b+c)/2.
area = sqrt(s*(s-a)*(s-b)*(s-c))

write(*,*)'Area =', area

end program Heron_Triangle_Area
