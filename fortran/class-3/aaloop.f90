program aaloop
 implicit none

 integer :: m1,m2,m3,m4, marks(1000), i, nlines, avg, sum

!We can also import the marks from a .dat file in pwd using
!for i in $(seq 1 1000); do echo $((RANDOM%100+1)); done >> aa.dat

 open(unit=1,file='aa.dat',action='read')
 open(unit=2,file='result.dat',action='write')
!to close, we use close(1) (not compulsory)

 nlines=1000
 sum=0
 do i=1,nlines
  read(1,*) marks(i) !read data from unit handle 1. marks is the  first column and has integer data.
  !write(*,*) marks
  sum=sum+marks(i)
 enddo
 
 write(2,"(a8,5x,i6)") "Avg: ",sum/nlines

end program aaloop
