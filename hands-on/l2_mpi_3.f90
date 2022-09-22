! a program to generate 1000 random numbers in each process, in the range [0, 1] in process 0, in the range [1,2] in process 1, in the range [2,3] in process 2, and so on. And, find average, max and min values (over all the numbers)

program min_max_av
 implicit none
 include 'mpif.h'
 
 integer :: ierr, nprocs, id,i
 real(kind=8) :: rands(1000), summ, total_summ
 
 call mpi_init(ierr)
 call mpi_comm_size(mpi_comm_world,nprocs,ierr)
 call mpi_comm_rank(mpi_comm_world,id,ierr)
 
 summ = 0
 
 do i=1,1000
  rands(i) = id+rand()
  summ = summ + rands(i)
 end do

 call mpi_reduce(summ,total_summ,1,mpi_double_precision,mpi_sum,0,mpi_comm_world,ierr)
 
 if(id==0) then
  total_summ = total_summ/(nprocs*1000)
  write(*,*) 'The average is: ', total_summ
 end if

 call mpi_finalize(ierr)
 
end program min_max_av
