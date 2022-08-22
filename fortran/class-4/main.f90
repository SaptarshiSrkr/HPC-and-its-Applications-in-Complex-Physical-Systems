program aa
 implicit none
 real :: p,q,r,root1,root2

 p=10;q=20;r=-5

 call quad_roots(p,q,r,root1,root2)
 
 write(*,*) 'ROOTS: ',root1,root2

end program aa

!TO COMPILE

!gfortran main.f90 subroutine.f90 -o a.x

!OR

!gfortran -o main.f90
!gfortran -o main.f90
!gfortran main.o subroutine.o -o a.x
