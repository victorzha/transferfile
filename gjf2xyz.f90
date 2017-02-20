 1 program gjf2xyz
  2 |  use kinds, only: DP
  3 |  use file,  only: name_main
  4 |  !----------------------------------------------------------------------------
  5 |  implicit none
  6 |  !----------------------------------------------------------------------------
  7 |  integer                     :: fid, natom
  8 |  real(DP)      , allocatable :: x(:,:)
  9 |  character(  2), allocatable :: symbol(:)
 10 |  character(200)              :: fgjf, fxyz
 11 |  !----------------------------------------------------------------------------
 12 |  fid    = 1
 13 |  call getarg(1,fgjf)
 14 |  fxyz=trim(name_main(fgjf))//".xyz"
 15 |  !----------------------------------------------------------------------------
 16 |  call get_gjf_natom(fgjf, natom)
 17 |  !----------------------------------------------------------------------------
 18 |  allocate(x     (3,natom))
 19 |  allocate(symbol(  natom))
 20 |  call get_gjf_coord(fgjf, natom, x, symbol)
 21 |  call write_xyz(fxyz,natom,symbol,x)
 22 |  !----------------------------------------------------------------------------
 23 |  deallocate(x     )
 24 |  deallocate(symbol)
 25 |  !----------------------------------------------------------------------------
 26 |  stop
 27 end
