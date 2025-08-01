program main
  use fpm_netcdf, only: read_netcdf
  use iso_fortran_env, only: dp => real64
  implicit none

  character(len=128) :: filename                     !! netcdf file name
  integer, parameter :: nlat=240, nlon=480, ntime=12 !! dimensions for data
  real(dp)           :: temp2(nlon, nlat, ntime)     !! 2m air temperature

  filename = "./data/Mutz_et_al_2018_e009_p000_lterm.nc"
  call read_netcdf(filename, "temp2", temp2, nlon, nlat, ntime)

end program main
