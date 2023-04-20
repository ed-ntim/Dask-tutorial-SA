Dask is a library that takes functionality from a number of popular libraries used for scientific computing in Python, including Numpy, Pandas, and scikit-learn, and extends them to run in parallel across a variety of different parallelisation setups. This includes multiple threads or multiple processes on the same node, as well as using multiple nodes.

While multi-node support is built in to Dask, we will use the dask-mpi package to help Dask interact with Jobqueue to create the right number of processes.


While MPI by default uses a collectivist approach to its communications, Dask’s model is a co-ordinator–worker one. To translate between these, dask-mpi finds the number of ranks from MPI, and does the following with them:

    1 - the first rank becomes the co-ordinator for the team of workers,
    2 - the second rank continues executing the program in serial, and
    3 - any remaining ranks become workers, and do any work that is submitted to them from the second rank.

It then ignores MPI completely, using Dask’s built-in communications methods to communicate between the processes instead. MPI is only used to create the right number of processes, and communicate that number to Dask.

If we are programming in parallel effectively, most of our computation time will be spent having the workers do the work. If each piece of work is quite expensive, then this may mean that both the co-ordinator and the serial part of the work sit idling. 

So, to get Dask working with MPI under Slurm, we need two things:

  -  a Python program that uses dask-mpi to get information from MPI about the setup it is running under, and
  -  a job script that uses mpirun
