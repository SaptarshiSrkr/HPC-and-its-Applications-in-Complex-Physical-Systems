!program to read the data from a text file and write the same data to another file 'output3.xyz'.

program read_write
 implicit none
 
 integer :: ii,i,j,k
 character :: c 
 real :: r1,r2,r3,r4
 
 open(unit=1,file='input3.xyz',action='read')
 open(unit=2,file='output3.xyz',action='write')
 
 do i=1,878
  
  read(1,*) ii
  write(2,'(i2)') ii
  
  read(1,*) ii
  write(2,'(i1)') ii
 
  do k=1,13
   read(1,*) c,r1,r2,r3
   write(2,'(a,3x,f7.4,3x,f7.4,3x,f7.4)') c,r1,r2,r3
  end do
  
 end do 
end program read_write
