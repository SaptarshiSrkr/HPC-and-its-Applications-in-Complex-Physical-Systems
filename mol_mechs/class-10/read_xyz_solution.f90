! program to read a given xyz file and store the atom labels and coordinates in array. 
! ./executable input_xyz_file_name  

!Task is to modify this code such that it outputs pairs of indices that form a bond (d < 0.6(r1+r2))

program readxyz
 implicit none

 integer :: natoms,atom,i,j,nbonds
 real(kind=8) :: d
 character(len=200) :: file1 
 character(len=2),allocatable :: atm(:)
 real,allocatable :: radii(:)
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
 allocate(radii(natoms))

! read the xyz file and storage atm labels and coordinates 
 read(1,*)
 read(1,*)
 do atom=1,natoms 
   read(1,*) atm(atom),coor(atom,:) 
 enddo
 
! create radii list
 do i=1,natoms
   if (atm(i) == 'O') then
     radii(i) = 1.3
   elseif (atm(i) == 'H') then
     radii(i) = 1.0
   elseif (atm(i) == 'C') then
     radii(i) = 1.7
   endif
 enddo
 
! calculate distances between pairs and check if bond or not. Print pairs of bonds and total number of bonds
 write(*,'(a)') 'We have bonds between the following pairs of atoms (index starts from 1):' 
 nbonds = 0
 do j=2,natoms
   do i=1,j-1 ! we calculate the distance for pairs (i,j) where i<j to avoid double counting and the i=j cases
     d = sqrt((coor(i,1)-coor(j,1))**2+(coor(i,2)-coor(j,2))**2+(coor(i,3)-coor(j,3))**2)
     if (d < 0.6*(radii(i)+radii(j))) then
       nbonds = nbonds+1
       write(*,'(a,i1,a,i1,a)',advance='no') '{',i,' ',j,'} ' 
     endif
   enddo
 enddo
 write(*,*)
 write(*,*)
 write(*,'(a,i2,a)') 'There are ',nbonds,' bonds in total.' 
 
end program readxyz
