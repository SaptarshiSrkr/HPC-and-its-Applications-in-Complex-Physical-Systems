program mpireduce
 implicit none
 include 'mpif.h'
  
 integer :: i,N,sum,final_sum
 integer :: ierr, nproc, rank

 call mpi_init(ierr)
 call mpi_comm_size(mpi_comm_world,nproc,ierr)
 call mpi_comm_rank(mpi_comm_world,rank,ierr)

 N=100
 sum=0

 do i= 1+rank, N, nproc
  sum=sum+i
 enddo

 write(*,"(a,i2,2x,a,i4)") "Sum of ",N/nproc," numbers is: ",sum
 
 call MPI_Reduce(sum,final_sum,1,MPI_Integer,MPI_Sum,0,MPI_Comm_World,ierr)

 if(rank==0) then
  write(*,"(a,i4)") 'Final Sum: ',final_sum
 endif
  
 call mpi_finalize(ierr)
end program mpireduce
