subroutine quad_roots(a,b,c,r1,r2)
 implicit none
 
 real :: a,b,c,r1,r2,dis

 dis=b*b-4*a*c

 if(dis>=0) then
  dis=sqrt(dis)
  r1=(-b+dis)/(2*a)
  r1=(-b-dis)/(2*a)
 else
  write(*,*) 'Roots are imaginary'
  r1=0; r2=0
 endif
end subroutine
