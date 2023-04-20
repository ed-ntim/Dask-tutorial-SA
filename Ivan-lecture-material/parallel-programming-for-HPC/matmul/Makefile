.DEFAULT_GOAL := compile

OPENBLAS_HOME=/apps/libs/openblas/0.2.19/gcc-6.1.0

SIZE = 100
MODE = 2

FLAGS = -Wall -Wextra
HPC_FLAGS = -O3
COMPILER = mpic++
UTILITIES = identityMatrix.cpp utils.cpp
SRC = matmulSquareDistributed.cpp

ifeq "$(MODE)" "2"
OPENBLAS_FLAGS = -I ${OPENBLAS_HOME}/include/ -L ${OPENBLAS_HOME}/lib -lopenblas -lgfortran
else
OPENBLAS_FLAGS =
endif

compile:
	$(COMPILER) $(FLAGS) $(OPENBLAS_FLAGS) $(HPC_FLAGS) -D SIZE=${SIZE} -D MODE=${MODE} $(UTILITIES) $(SRC)
output:
	$(COMPILER) $(FLAGS) $(OPENBLAS_FLAGS) $(HPC_FLAGS) -D SIZE=${SIZE} -D MODE=${MODE} -D OUTPUT $(UTILITIES) $(SRC)
gpu:
	nvcc -O3 -D SIZE=${SIZE} -D MODE=3 -x cu $(UTILITIES) $(SRC) -I /apps/libs/openmpi/4.0.0-gcc7.3.0/include -L /apps/libs/openmpi/4.0.0-gcc7.3.0/lib -lmpi -lcublas
gpu_output:
	nvcc -O3 -D SIZE=${SIZE} -D MODE=3 -D OUTPUT -x cu $(UTILITIES) $(SRC) -I /apps/libs/openmpi/4.0.0-gcc7.3.0/include -L /apps/libs/openmpi/4.0.0-gcc7.3.0/lib -lmpi -lcublas
