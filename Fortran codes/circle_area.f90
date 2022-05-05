! PROGRAM TO CALCULATE AREA OF A CIRCLE
PROGRAM circle_area
  IMPLICIT NONE
  REAL::radius=5,pi=3.141,area
  area=pi*radius**2
  WRITE(*,*)"Area of the Circle is = ",area
END PROGRAM circle_area

