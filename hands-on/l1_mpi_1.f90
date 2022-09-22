!mpi fortran program to print 'Successful' if the process id is  odd number
program mpi_odd
 implicit none
 include 'mpif.h'
 
 integer :: ierr,id,nprocs
 
 call mpi_init(ierr)
 call mpi_comm_size(mpi_comm_world,nprocs,ierr)
 call mpi_comm_rank(mpi_comm_world,id,ierr)

 if(mod(id,2)==1) then
  write(*,*) 'Sucessful'
 endif

 call mpi_finalize(ierr)
end program mpi_odd
