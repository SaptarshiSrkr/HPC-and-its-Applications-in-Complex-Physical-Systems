program readwriteint
 implicit none
 include 'mpif.h'
 
 integer :: ierr, nproc, rank, i, N,s
 real :: randints(1000), sumr, maxr, minr, sum_final, max_final, min_final
 
 call mpi_init(ierr)
 call mpi_comm_size(mpi_comm_world,nproc,ierr)
 call mpi_comm_rank(mpi_comm_world,rank,ierr)
 
 s=131489+rank
 call srand(s)

 N=1000
 
 do i=1,N
  randints(i)=rand()+rank  
 enddo

 maxr = maxval(randints)
 minr = minval(randints)
 sumr = sum(randints)

 call mpi_reduce(sumr,sum_final,1,MPI_Real,MPI_Sum,0,MPI_Comm_World,ierr)
 call mpi_reduce(maxr,max_final,1,MPI_Real,MPI_Max,0,MPI_Comm_World,ierr)
 call mpi_reduce(minr,min_final,1,MPI_Real,MPI_Min,0,MPI_Comm_World,ierr)

 if(rank==0) then
  write(*,*) 'Average', sum_final/(nproc*1000)
  write(*,*) 'Max', max_final
  write(*,*) 'MIn', min_final
 endif

 call mpi_finalize(ierr)
end program readwriteint
 

  
