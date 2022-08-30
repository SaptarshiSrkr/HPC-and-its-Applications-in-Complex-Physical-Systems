program assignment2_serial
 implicit none
 
 real(kind=8) :: values(300*300)
 
 open(unit=1,file='random_numbers.dat',action='read')
 
 read(1,*) values
 write(*,*) 'Average value = ',sum(values)/(300*300)
 
endprogram assignment2_serial
