!FORTRAN program that computes the average and standard deviation of N real numbers

program avg_stdev
 implicit none
 integer :: N,i
 real :: av,stdev
 real, allocatable :: a(:)
 
 write(*,*) 'Enter N: '
 read(*,*) N

 allocate(a(N))
 
 do i=1,N
  a(i) = i
 end do
 
 av = 0
 do i=1,N
  av = av+a(i)
 end do
 av = av/N
 
 stdev = 0
 
 do i=1,N
  stdev = stdev + (a(i)-av)**2
 end do
 
 stdev = stdev/N
 stdev = sqrt(stdev)
 
 write(*,*) 'The average is : ', av
 write(*,*) 'The standard deviation is: ',stdev

end program avg_stdev
