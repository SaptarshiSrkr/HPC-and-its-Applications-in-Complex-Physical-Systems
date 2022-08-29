program numaverage
 implicit none
 include 'mpif.h'

 integer :: ierr,N,j,i,nproc,rank,sum1
 integer,allocatable :: sums(:)
 real :: average
 
 call mpi_init(ierr)
 call mpi_comm_size(mpi_comm_world,nproc,ierr)
 call mpi_comm_rank(mpi_comm_world,rank,ierr)

 N=100
 sum1=0
 allocate(sums(0:nproc-1))

 do i=1+rank,N,nproc
  sum1=sum1+i
 enddo
 
 if(rank==0) then
  sums(0)=sum1
 else
  call mpi_send(sum1,1,mpi_int,0,mpi_any_tag,mpi_comm_world,ierr)
 endif

 if(rank==0) then
  do j=1,nproc
   call mpi_recv(sums(j),1,mpi_int,j,mpi_any_tag,mpi_comm_world,mpi_status_ignore,ierr)
  enddo
 average = sum(sums)/nproc

 write(*,*) 'The average of first ',N,' integers is: ',average
 endif
 
 call mpi_finalize(ierr)
end program numaverage

 
 
