program main   
    
    use, intrinsic :: iso_c_binding
    implicit none
    include "fftw3.f03"
       
    integer, parameter :: n = 1024
    real(c_double), allocatable :: data_in(:)
    complex(c_double_complex), allocatable :: data_out(:)
    type(c_ptr) :: planf

    real(16) :: t = 0.0
    real(16) :: dt=1/real(n-1)
    real(16) :: val
    integer::i

    open (unit = 1, file = "../res/signal_time")
    open (unit = 2, file = "../res/signal_frequency")

    allocate(data_in(n))
    allocate(data_out(n/2+1))

    do i=1,n
        t=t+dt
        data_in(i)=sin(2*3.1415*t*200)+2*sin(2*3.1415*t*400)
        write(1,*) t," ",data_in(i)
    end do
  
    planf = fftw_plan_dft_r2c_1d(size(data_in), data_in, data_out, FFTW_ESTIMATE+FFTW_UNALIGNED)
    call fftw_execute_dft_r2c(planf, data_in, data_out)

    do i=1,n/2+1
        val=abs(data_out(i))
        if(val /= val)val=0.0
        write(2,'(I15," ", F15.10)')i, val
    end do
  
    call fftw_destroy_plan(planf)
      
end program main