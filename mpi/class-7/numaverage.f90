program numaverage
 implicit none
 include 'mpif.h'

 integer :: ierr,N,j,i,nproc,rank,total
 integer,allocatable :: sums(:)
 real :: average
 
 call mpi_init(ierr)
 call mpi_comm_size(mpi_comm_world,nproc,ierr)
 call mpi_comm_rank(mpi_comm_world,rank,ierr)
 
 if(rank==0) then
  write(*,*) 'Enter the number of integers: '
  read(*,"(i5)") N
 endif
 
 call mpi_bcast(N,1,mpi_int,0,mpi_comm_world,ierr)
 
 total=0
 allocate(sums(0:nproc-1))

 do i=1+rank,N,nproc
  total=total+i
 enddo
 
 if(rank==0) then
  sums(0)=total
 else
  call mpi_send(total,1,mpi_int,0,rank,mpi_comm_world,ierr)
 endif

 if(rank==0) then
 
  do j=1,nproc-1
   call mpi_recv(sums(j),1,mpi_int,j,j,mpi_comm_world,mpi_status_ignore,ierr)
  enddo
  
 write(*,'(a,i5,a,i10)') 'The sum of first ',N,' integers is: ',sum(sums)
 endif
 
 call mpi_finalize(ierr)
end program numaverage

 
 
