!Write the program shown in the previous slides (ring), but without using MPI_Any_Tag constant

program ring_send
 implicit none
 include 'mpif.h'
  
 integer :: ierr,nprocs,id,dat 
  
 call mpi_init(ierr)
 call mpi_comm_size(mpi_comm_world,nprocs,ierr)
 call mpi_comm_rank(mpi_comm_world,id,ierr)
 
 dat = 10
 
 if(id==0) then
  call mpi_send(dat,1,mpi_int,1,id,mpi_comm_world,ierr)
 else
  call mpi_recv(dat,1,mpi_int,id-1,id-1,mpi_comm_world,mpi_status_ignore,ierr)
  write(*,*) 'process ',id, ' received data from process ',id-1
  call mpi_send(dat,1,mpi_int,mod(id+1,nprocs),id,mpi_comm_world,ierr)
 end if

 if(id==0) then
  call mpi_recv(dat,1,mpi_int,nprocs-1,nprocs-1,mpi_comm_world,mpi_status_ignore,ierr)
  write(*,*) 'process ',id, ' received data from process ',nprocs-1
 end if
 
 call mpi_finalize()
end program ring_send
