program main

    use, intrinsic :: iso_c_binding
    implicit none
    include "fftw3.f03"
       
    integer, parameter :: n = 1024
    real(c_double), allocatable :: data_in(:)
    complex(c_double_complex), allocatable :: data_out(:)
    type(c_ptr) :: planf, planb

    real(16) :: t = 0.0
    real(16) :: dt=10/real(n-1)
    real(16) :: val
    integer::i

    integer,parameter :: seed = 86456
    call srand(seed)
    !czysty sinus
    open (unit = 3, file = "../res/clear_sinus_time")
    !zanieczyszczony sinus
    open (unit = 1, file = "../res/sinus_time")
    !zaniczyszczony sinus Fourier
    open (unit = 2, file = "../res/sinus_frequency")
    !odczyszczony sinus Fourier
    open (unit = 4, file = "../res/sinus_clear_frequency")
    !odczyszczony sinus Czas
    open (unit = 5, file = "../res/sinus_clear_time_after")
   

    allocate(data_in(n))
    allocate(data_out(n/2+1))

    do i=1,n
        t=t+dt
        write(3,*) t," ",sin(t)
        data_in(i)=sin(t) + rand()-rand()
        write(1,*) t," ",0.001*data_in(i)
    end do
  
    planf = fftw_plan_dft_r2c_1d(size(data_in), data_in, data_out, FFTW_ESTIMATE+FFTW_UNALIGNED)
    planb = fftw_plan_dft_c2r_1d(size(data_in), data_out, data_in, FFTW_ESTIMATE+FFTW_UNALIGNED)
    call fftw_execute_dft_r2c(planf, data_in, data_out)

    do i=1,n/2+1
        val=abs(data_out(i))
        if(val /= val)val=0.0
        write(2,'(I15," ", F15.10)')i, val
       
        if(abs(data_out(i))<50) data_out(i)=0.0
    end do

    do i=1,n/2+1

   
        write(4,'(I15," ", F15.10)')i, abs(data_out(i))
    end do

    call fftw_execute_dft_c2r(planb, data_out, data_in)

    t = 0.0
    dt=10/real(n-1)
    do i=1,n
        t=t+dt
        write(5,*) t," ",data_in(i)/n
 
    end do
  
    call fftw_destroy_plan(planf)
    call fftw_destroy_plan(planb)
    
    close(1)
    close(2)
    close(3)
    close(4)
    close(5)
      
end program main