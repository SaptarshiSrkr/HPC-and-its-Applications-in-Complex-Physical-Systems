program asgmt
 implicit none
 
 integer :: c2(13), c5(13), nlines, r1c9, r1c10, i,j
 real :: r1c2, r1c3, r1c4, r1c5, r1c6, r1c7, c6(13), c7(13),c8(13),c9(13),c10(13)
 character(len=10) :: c1(13), c3(13), c4(13), r1c1, r1c8, c11(13)
 
 nlines = 12293
 sections = 878
 open(unit=1,file='input4.pdb',action='read')
 open(unit=2,file='input4_out.pdb',action='write')

 read(1,*) r1c1, r1c2, r1c3, r1c4, r1c5, r1c6, r1c7, r1c8, r1c9, r1c10
 write(2,"(a6,4x,2(f5.3,4x),f5.3,2x,3(f5.2,2x),a1,1x,i1,11x,i1)") r1c1, r1c2, r1c3, r1c4, r1c5, r1c6, r1c7, r1c8, r1c9, r1c10

 do j=1,sections

  do i=1,13
   read(1,*) c1(i), c2(i), c3(i), c4(i), c5(i), c6(i), c7(i), c8(i), c9(i), c10(i)
   write(2,"a4,6x,i2,2x,a1,7x,a1,3x,i1,6x,3(f6.3,2x),2(f4.2,2x),11x,a1") c1(i), c2(i), c3(i), c4(i), c5(i), c6(i), c7(i), c8(i), c9(i), c10(i)
  enddo
  write(2,"a3") 'END'

 enddo
 

end program asgmt
