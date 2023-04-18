git clone https://github.com/Sera91/Dask-tutorial-SA.git

module load chpc/cuda/11.2/SXM2/11.2 chpc/openmpi/4.0.0/gcc-7.3.0 chpc/openblas/0.2.19/gcc-6.1.0 chpc/astro/anaconda/3

cd Dask-tutorial-SA

conda env create -f Sera_env.yml

cat<<EOF >>${HOME}/.bashrc
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/apps/chpc/astro/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/apps/chpc/astro/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/apps/chpc/astro/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/apps/chpc/astro/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
EOF


conda activate py310
