! program to read a given xyz file and store the atom labels and coordinates in array. 
! ./executable input_xyz_file_name  

program readxyz
 implicit none

 integer :: natoms,atom
 character(len=200) :: file1 
 character(len=2),allocatable :: atm(:)
 real(kind=8),allocatable :: coor(:,:) 
  

 call getarg(1,file1)
 open(unit=1,file=file1,action='read')

! count number of lines in the given xyz file 
 natoms=0
 read(1,*)
 read(1,*)
 do 
   read(1,*,end=100) 
   natoms=natoms+1
 enddo
 100 continue 
 rewind(1) 

! allocate the coor and atm arrays 
 allocate(coor(natoms,3))
 allocate(atm(natoms))

! read the xyz file and storage atm labels and coordinates 
 read(1,*)
 read(1,*)
 do atom=1,natoms 
   read(1,*) atm(atom),coor(atom,:) 
 enddo


end program readxyz
