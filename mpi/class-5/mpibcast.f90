program mpibcast
 implicit none
 include 'mpif.h'

 integer :: num, rank, ierr, nproc

 call mpi_init(ierr)
 call mpi_comm_size(mpi_comm_world,nproc,ierr)
 call mpi_comm_rank(mpi_comm_world,rank,ierr)
 
 if(rank==0) then
  num=1
 endif

 call mpi_bcast(num,1,mpi_int,0,mpi_comm_world,ierr)

 num=num+rank 

 write(*,"(a,i1,a,i1)") 'Result for process ',rank,' is ',num
 call mpi_finalize(ierr)
end program mpibcast
