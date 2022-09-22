!Fortran program to read 'input1.xyz' using 2D array.

program readinput1
 implicit none
 integer :: i
 real(kind=8) :: array(3)
 
 open(unit=1,file='input1.xyz',action='read')
 open(unit=2,file='output1.xyz',action='write')
 
 do i=1,9
  read(1,*) array
  write(2,'(3(f10.7,2x))') array
 end do
 
end program readinput1
