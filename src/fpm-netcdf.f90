module fpm_netcdf
  use netcdf
  use iso_fortran_env, only: dp => real64

  implicit none
  private

  public :: read_netcdf

contains


subroutine read_netcdf(filename, var_name, var, nlon, nlat, ntime)
! ==== Description
! simple procedure that reads from a netcdf file

! ====  Declarations
  character(len=*), intent(in)  :: filename               ! netcdf file name
  character(len=*), intent(in)  :: var_name               ! variable name (as in file)
  integer         , intent(in)  :: nlon, nlat, ntime      ! dimensions for data
  real(dp)        , intent(out) :: var(nlon, nlat, ntime) ! 2m air temperature
  integer                       :: ncid, varid, rv        ! netcdf-specifics

! ====  Instructions

  print *, "> reading 2m air temperature from NetCDF file"

  ! Open NetCDF file
  rv = nf90_open(filename, NF90_NOWRITE, ncid)
  if (rv /= nf90_noerr) stop 'Error opening file'

  ! Get variable ID for var
  rv = nf90_inq_varid(ncid, var_name, varid)
  if (rv /= nf90_noerr) stop 'Error finding variable'

  ! Read the variable
  rv = nf90_get_var(ncid, varid, var)
  if (rv /= nf90_noerr) stop 'Error reading variable'

  ! Close file
  rv = nf90_close(ncid)

  print *, "> printing values for all time steps at a single coordinate"
  print*, var(1,1,:)

end subroutine read_netcdf

end module fpm_netcdf
