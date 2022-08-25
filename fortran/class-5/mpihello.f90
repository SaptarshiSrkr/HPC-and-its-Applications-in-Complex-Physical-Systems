program main
 implicit none
 include 'mpif.h'

 integer :: id,np,ierr

 call MPI_INIT(ierr)
 call MPI_Comm_Size(MPI_COMM_World,np,ierr)
 call MPI_Comm_Rank(MPI_COMM_World,id,ierr)

 if(mod(id,2)==0) then
  write(*,"(a,i2,a,i2)") 'Hello World - rank/totproc = ',id,"/",np
 endif

 call MPI_FINALIZE(ierr)
end program main
