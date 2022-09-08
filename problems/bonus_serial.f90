program bonus_serial
 implicit none
 
 integer :: i, j, iter
 real :: val, diff
 real, dimension(300,300) :: random_numbers
 
 open(unit=1,file='random_numbers.dat',action='read')
 open(unit=2,file='output_serial.dat',action='write')
 
 do i=1,300
  read(1,'(300(1x,f6.4))') random_numbers(i,:)
 enddo 
  
 diff = 1
 iter = 0
 
 do while (diff > 0.001)
 
  diff = 0
  
  do i=2,299 !row
   do j=2,299 !columns
    val = (random_numbers(i-1,j)+random_numbers(i+1,j)+random_numbers(i,j-1)+random_numbers(i,j+1))/4
    diff = diff + abs(random_numbers(i,j)-val)
    random_numbers(i,j) = val
   end do
  end do
  
  iter = iter+1
  write(*,*) diff
  
 end do 
 
 do i=1,300
  write(2,'(300(1x,f6.4))') random_numbers(i,:)
 enddo
 
 write(*,*) 'Total no. of iterations: ', iter
 
end program bonus_serial
