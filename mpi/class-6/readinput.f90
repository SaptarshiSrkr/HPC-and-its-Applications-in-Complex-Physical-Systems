program readinput
 
 implicit none
 include 'mpif.h'
 
 integer :: nproc,ierr,i,n(10),rank
 
 call mpi_init(ierr)
 call mpi_comm_size(mpi_comm_world,nproc,ierr)
 call mpi_comm_rank(mpi_comm_world,rank,ierr)
  
 if(rank==0) then
  do i=1,nproc
   write(*,"(a,i1,a)") 'Enter the ',i,' integer:'
   read(*,"(i1)") n(i)
  enddo
 endif
 
 call mpi_bcast(n,nproc,mpi_integer,0,mpi_comm_world,ierr)

 write(*,"(a,i1,a,i1)") 'Process ',rank,' got: ', n(rank)
 
 call mpi_finalize(ierr)
 
end program readinput


