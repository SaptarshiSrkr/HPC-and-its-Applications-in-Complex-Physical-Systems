program assignment2_non_blocking
 implicit none
 include 'mpif.h'
 
 integer :: ierr,nproc,id,i,request(mpi_status_size),status(mpi_status_size)
 real(kind=8) :: row(300),skip(300),total,final_total
  
 call mpi_init(ierr)
 call mpi_comm_size(mpi_comm_world,nproc,ierr)
 call mpi_comm_rank(mpi_comm_world,id,ierr)
 
 open(unit=1,file='random_numbers.dat',action='read')
 
 total = 0
 
 do i=0,299
  if(mod(i,nproc)==id) then
   read(1,*) row
   total = total+sum(row)
  else
   read(1,*) skip
  endif 
 enddo 
  
 if(id/=0) then
 
  call mpi_isend(total,1,mpi_double,0,id,mpi_comm_world,request,ierr)
 else
  final_total=total
  do i=1,nproc-1
   call mpi_irecv(total,1,mpi_double,i,i,mpi_comm_world,request,ierr)
   call mpi_wait(request,status)
   final_total=final_total+total
  enddo
  write(*,*) 'Average value = ',final_total/(300*300)
    
 endif  
  
 call mpi_finalize(ierr)
  
end program assignment2_non_blocking
