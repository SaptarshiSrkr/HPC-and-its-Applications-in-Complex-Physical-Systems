program bonus_parallel
 implicit none
 include 'mpif.h'
 
 integer :: i, j, iter, ierr, rowspp, id, nprocs
 real :: val, diff, temp_mat(300,300), temp_vec(300)
 
 call mpi_init(ierr)
 call mpi_comm_size(mpi_comm_world,nprocs,ierr)
 call mpi_comm_rank(mpi_comm_world,id,ierr)
 
 open(unit=1,file='random_numbers.dat',action='read')
 open(unit=2,file='random_numbers_copy.dat',action='write')
 
 open(unit=3,file='output_parallel.dat',action='write')
   
 !Making a copy of the dat file so that we don't overwrite the source file
    
 if(id==0) then
 
  do i=1,300
   read(1,'(300(1x,f6.4))') temp_mat(i,:)
   write(2,'(300(1x,f6.4))') temp_mat(i,:)
  enddo   

  do i=1,nprocs-1   
   call mpi_send(temp_mat,300*300,mpi_real,i,i,mpi_comm_world,ierr)
  end do
  
 endif 
 
 diff = 1
 iter = 0
 rowspp = 300/nprocs !Chunk size for each process. Must be of integer type
 
 do while (diff > 0.001)
     
  diff = 0
      
  if(id==0) then !If rank is 0, ignore first row
                
   do i=2,rowspp !Iterate over cells and do averaging
    do j=2,299
     val = (temp_mat(i-1,j)+temp_mat(i+1,j)+temp_mat(i,j-1)+temp_mat(i,j+1))/4
     diff = diff + abs(temp_mat(i,j)-val)
     temp_mat(i,j) = val
    end do
   end do
      
  else if(id==nprocs-1) then !If rank is nprocs-1, ignore last row
   
   call mpi_recv(temp_mat,300*300,mpi_real,0,id,mpi_comm_world,mpi_status_ignore,ierr)      
    
   do i=(id*rowspp)+1,299 !Iterate over cells and do averaging
    do j=2,299
     val = (temp_mat(i-1,j)+temp_mat(i+1,j)+temp_mat(i,j-1)+temp_mat(i,j+1))/4
     diff = diff + abs(temp_mat(i,j)-val)
     temp_mat(i,j) = val
    end do
   end do 
   
  else
  
   call mpi_recv(temp_mat,300*300,mpi_real,0,id,mpi_comm_world,mpi_status_ignore,ierr)   
        
   do i=(id*rowspp)+1,(id+1)*rowspp !Iterate over cells and do averaging
    do j=2,299
     val = (temp_mat(i-1,j)+temp_mat(i+1,j)+temp_mat(i,j-1)+temp_mat(i,j+1))/4
     diff = diff + abs(temp_mat(i,j)-val)
     temp_mat(i,j) = val
    end do
   end do 
       
  end if   
 
  if(id/=0) then !Send chunk to process 0
   call mpi_send(temp_mat((id*rowspp)+1:(id+1)*rowspp,:),rowspp*300,mpi_real,0,id,mpi_comm_world,ierr)
   
  else if(id==0) then !Combine all updated chunks to form updated matrix
  
   iter = iter+1
   
   do i=1,nprocs-1   
    call mpi_recv(temp_mat((i*rowspp)+1:(i+1)*rowspp,:),rowspp*300,mpi_real,i,i,mpi_comm_world,mpi_status_ignore,ierr)
   end do
   
   do i=1,nprocs-1  !Send updated matrix to all processes 
    call mpi_send(temp_mat,300*300,mpi_real,i,i,mpi_comm_world,ierr)
   end do
   
  end if
  
  call mpi_allreduce(diff,diff,1,mpi_real,mpi_sum,0,mpi_comm_world,ierr) !Calculate total absolute error and send to all processes
  
  if(id==0) then
   write(*,*) diff
  endif
     
 end do
    
 if(id==0) then 
 
  do i=1,300 !Write final matrix to 'output_parallel.dat' file
   write(3,'(300(1x,f6.4))') temp_mat(i,:)
  enddo 
  
  write(*,*) 'Total no. of iterations: ', iter !Write total number of iterations (must be 26525)
 
 endif
 
 call mpi_finalize(ierr)
end program bonus_parallel
