#Tutorial on Parallel/fast ML pipelines in Python 

##First ssh connection to the Lengau cluster

The first step to do is login to the CHPC cluster.
To do this you can open the CLI (or terminal) on your laptop
and type the command below for login node 2 ( a shared login node):


```bash
ssh -o PubkeyAuthentication=no -o PreferredAuthentications=password  user@lengau.chpc.ac.za
```

or 

```bash
ssh -o PubkeyAuthentication=no -o PreferredAuthentications=password  user@scp.chpc.ac.za
```



changing 'user' with your own username.
It will ask the password associated with your user account.

##Automatic connection to LENGAU CLUSTER

To connect to the CHP  LENGAU cluster in an automatic and safe way we need to create a pair of ssh keys

step 1: ssh key creation

You can use the command:

```bash
ssh-keygen -t ecdsa -b 521
```

step 2: copy public key to Lengau

```bash
scp -o PubkeyAuthentication=no -o PreferredAuthentications=password  .ssh/id_user_Leng.pub   user@lengau.chpc.ac.za:/home/user/.ssh/
```
step 3: try the connection


```bash
ssh -i /home/user/.ssh/id_user_Leng  user@scp.chpc.ac.za
```

##Setting Python environment

Before starting the tutorial activities, we need to setup the conda environment, where we install all the modules/packages needed for running
ML pipelines in Python in parallel with the Dask scheduler.

First, we need to load the conda module and all the libraries that serve as interface of the Python libraries for GPUs (graphical processing units).

```bash
module load chpc/cuda/11.2/SXM2/11.2 chpc/openmpi/4.0.0/gcc-7.3.0 chpc/openblas/0.2.19/gcc-6.1.0 chpc/astro/anaconda/3
```

Now we can create the Python environment using conda.

For people who are not expert conda users here there is the CONDA documentation: 


Before we get started, some of you might be wondering what the difference is between conda, pip, and venv.

I can’t put it any better than this: 
  - pip is a package manager for Python
  - venv is an environment manager for Python
  - conda is both a package and environment manager and is language agnostic.

Whereas pip only installs Python packages from PyPI, conda can both

  -  Install packages (written in any language) from repositories like Anaconda Repository and Anaconda Cloud.
  -  Install packages from PyPI by using pip in an active Conda environment.



To automize this process I created the file Sera_env2.yml
from which you can set a conda environment doing:

```bash
conda env create -f env_tutorial.yml
```



##Running jobs on Lengau computing nodes

The Lengau cluster is managed through a PBSPRO scheduler, with queues and projects.

To see  the names of the available queues we can use the command:

```bash
qstat -q
```

To see on which nodes are running the jobs at the moment 
```
qstat -rn
```

To see which nodes are free at the moment:

```bash
pbsnodes -ajS
```

To run interactive PBS session you can type:

```bash
qsub -P CHPC -I -l nodes=1:ppn=4,walltime=00:15:00 -j Sera_test
```


##Overview of the Python scriptst

The Python scripts that we will use in this tutorial activity focus on a classification task, and make use of two common datasets in Supervised ML: digits
dataset and iris dataset


All the python scripts that we will use today are in the subfolder scripts

 
 

##Overview of the notebooks

- [00_overview.ipynb](notebooks/00_overview.ipynb)
  : A brief overview of the Dask API
  

- [01_dataframe.ipynb](notebooks/01_dataframe.ipynb)
  : performing operations on dataframe with dask


- [02_local_cluster_monte_carlo_estimate_of_pi.ipynb](notebooks/02_local_cluster_monte_carlo_estimate_of_pi.ipynb)
  : A short recap of `LocalCluster`s that runs a Monte Carlo estimate of the number pi [that is explained here](https://en.wikipedia.org/wiki/Pi#Monte_Carlo_methods).
 

- [03_Image_classification_with_RESNET.ipynb](notebooks/03_image_classification.ipynb)
  : This jupyter notebook show as to run the RESNET model training on GPUs with dask. As input data for the model training and evaluation we used the Stanford Dogs Dataset[dataset webpage](http://vision.stanford.edu/aditya86/ImageNetDogs/)


- [04_Galaxy_classification.ipynb](notebooks/04_Galaxy_classification.ipynb)




Depending on what type of a learner you are, you might want to learn more about Dask itself before diving in here.  The <https://examples.dask.org> website and especially [this binder with all the examplpes to be run interactively](https://mybinder.org/v2/gh/dask/dask-examples/master?urlpath=lab) are a great place to start.
