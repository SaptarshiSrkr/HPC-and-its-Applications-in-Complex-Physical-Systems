!program using if statements to find a largest of three numbers (three numbers must be different)

program compare
 implicit none
 integer :: a(3),i
 
 do i=1,3
  write(*,*) 'Enter a number: '
  read(*,*) a(i)
 end do
 
 if (a(1)>a(2)) then
 
  if (a(1)>a(3)) then
   write(*,*) a(1), ' is the largest number'
  else
   write(*,*) a(3), ' is the largest number'
  endif

 else if (a(1)>a(3)) then
 
  if (a(1)>a(2)) then
   write(*,*) a(1), ' is the largest number' 
  else
   write(*,*) a(2), ' is the largest number' 
  endif
  
 else
  write(*,*) a(3), ' is the largest number' 
  
 end if 

end program compare
