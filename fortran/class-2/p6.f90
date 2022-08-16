program p6
 implicit none

 integer :: sum,i1,i2,i3
 
 i1=10
 i2=30
 i3=20

 if(i1>i2) then
  if(i1>i3) then
   write(*,*) 'i1'
  else
   write(*,*) 'i3'
  endif
 else
  if(i2>i3) then
   write(*,*) 'i2'
  else
   write(*,*) 'i3'
  endif
 endif

 write(*,*) 'Sum: ',i1+i2+i3

end program p6
