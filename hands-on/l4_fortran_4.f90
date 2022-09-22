program series_sum
 implicit none
 
 integer :: x, summ
 
 x = 21
 call sum_for(x)
 write(*,*) 'The sum is: ',summ
 
 contains
 
  subroutine sum_for(x)
   implicit none
 
   integer :: summ,i,x
 
   summ=0
 
   do i=1,5
    summ = summ + (x**(2*i))/(2*i) 
   end do
 
  end subroutine sum_for
  
end program series_sum
