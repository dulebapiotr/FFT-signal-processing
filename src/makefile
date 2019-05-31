all: signal signal_run sinus sinus_run

signal:
	gfortran -o signal signal.f90 -Ldirectory -lfftw3

signal_run:
	./signal
	

sinus:
	gfortran -o sinus sinus.f90 -Ldirectory -lfftw3
sinus_run:
	./sinus
