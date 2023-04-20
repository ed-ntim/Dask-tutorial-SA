TIMEIT = python -m timeit -s 'import sum_abs_timing as t'

FUNCTIONS = \
ranged_forloop \
indexed_forloop \
functional_plain \
functional_numpy 
#\dotprod



all: $(addsuffix .time, $(FUNCTIONS))



%.time: 
	$(TIMEIT) "t.$*(t.xlst)"
	$(TIMEIT) "t.$*(t.xarr)"

#see this for more info
# https://stackoverflow.com/questions/44224696/converting-numpy-array-to-a-set-takes-too-long/44226069#44226069
