program p4

 !Declaration (i3 not declared, still it works as Fotran 77 makes declaration of all variables not compulsory, starts with i -> integer, by default. Adding 'implicit none' removes this feature.)

 integer :: sum,i1,i2
 
 !Initialization and Main body

 i1=10
 i2=20
 i3=30

 sum = i1+i2+i3

 write(*,*) 'Sum: ',sum

end program p4
