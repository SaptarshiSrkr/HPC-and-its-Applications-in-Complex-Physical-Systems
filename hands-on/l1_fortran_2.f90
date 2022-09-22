!program to calculate area of a circle

program circle_area
 implicit none
 
 real :: r,area
 real, parameter :: pi = 3.1415926535
 
 write(*,*) 'Enter the radius: '
 read(*,*) r
 
 area = pi*r*r
 
 write(*,*) 'The area is: ',area

end program circle_area
 
