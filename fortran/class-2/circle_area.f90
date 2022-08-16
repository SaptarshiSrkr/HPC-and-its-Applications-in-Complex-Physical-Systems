program circle_area
 implicit none
	
 real :: radius, pi, area

 pi = 3.14
 radius = 2.77

 area = pi*radius*radius

 write(*,*) 'Area of circle: ',area

end program circle_area
