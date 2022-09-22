!Fortran program to read 'input1.xyz' using 1D array.

program readinput1
 implicit none
 integer :: i
 real :: array(9,3)
 
 open(unit=1,file='input1.xyz',action='read')
 open(unit=2,file='output1.xyz',action='write')
 
 read(1,*) array
 
 do i=1,9
  write(2,*) array(i,:)
 end do
 
end program readinput1
