program mybarrier
 implicit none
 include 'mpif.h'
 
 integer :: ierr, nprocs, id, i, test
 
 call mpi_init(ierr)
 call mpi_comm_size(mpi_comm_world,nprocs,ierr)
 call mpi_comm_rank(mpi_comm_world,id,ierr)

 test = 1

!Barrier Starts

 if(id/=0) then
  call mpi_send(test,1,mpi_integer,0,id,mpi_comm_world,ierr)
  write(*,*) 'Process ',id,' at start of barrier'
 endif

 if(id==0) then
  write(*,*) 'Process ',0,' at start of barrier'
  do i=1,nprocs-1
   call mpi_recv(test,1,mpi_integer,i,i,mpi_comm_world,mpi_status_ignore,ierr)
  enddo
 end if
 
 if(id==0) then
  do i=1,nprocs-1
   call mpi_send(test,1,mpi_integer,i,i,mpi_comm_world,ierr)
  enddo
  write(*,*) 'Process ',0,' at end of barrier'
 end if

 if(id/=0) then
  call mpi_recv(test,1,mpi_integer,0,id,mpi_comm_world,mpi_status_ignore,ierr)
  write(*,*) 'Process ',id,' at end of barrier'
 endif

!Barrier Ends

 call mpi_finalize(ierr)
end program mybarrier
 

 

  
 
