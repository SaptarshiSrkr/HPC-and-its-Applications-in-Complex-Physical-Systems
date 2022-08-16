program read_write
 implicit none
 
 character(len=10) :: r1c1, r1c8, col1(13), col3(13), col4(13), col11(13),sep
 integer :: r1c9, r1c10, nsections, i, j, col2(13), col5(13)
 real :: r1c2, r1c3, r1c4, r1c5, r1c6, r1c7, col6(13), col7(13), col8(13), col9(13), col10(13)
 
 open(unit=1,file='input4.pdb',action='read')
 open(unit=2,file='output4.pdb',action='write')
 
 !For first line
 read(1,*) r1c1, r1c2, r1c3, r1c4, r1c5, r1c6, r1c7, r1c8, r1c9, r1c10
 write(2,"(a6,3(4x,f5.3),3(2x,f5.2),1x,a1,1x,i1,11x,i1)") r1c1, r1c2, r1c3, r1c4, r1c5, r1c6, r1c7, r1c8, r1c9, r1c10
 
 !For similar sections
 nsections = 878
 do j=1,nsections
 
  do i=1,13
   read(1,*) col1(i),col2(i),col3(i),col4(i),col5(i),col6(i),col7(i),col8(i),col9(i),col10(i),col11(i)
   write(2,"(a4,5x,i2,2x,a1,7x,a1,3x,i1,6x,3(f6.3,2x),f4.2,2x,f4.2,11x,a1)") & 
   col1(i),col2(i),col3(i),col4(i),col5(i),col6(i), &
   col7(i),col8(i),col9(i),col10(i),col11(i)
  enddo
  
  !For separator
  read(1,*) sep
  write(2,"(a3)") sep
    
 enddo
 
end program read_write
