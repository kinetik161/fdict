program test_dict

  use tst_utils

  implicit none

  type(dict) :: dic
  integer :: i, N, step

  ! fill dictionary
  dic = ('string'.kv."Hello world")

  N = 1000
  step = 25

  write(*,*) 'Overwriting same key'
  ! we should here allocate around 1Gb
  do i = 1 , N
     dic = dic // ('string'.kv."Hello world")
     if ( mod(i,step) == 0 ) then
        call show_mem
     end if
  end do

  ! print all the values
  call print(dic)

  call delete(dic)

end program test_dict
