from dask.distributed import Client
import socket


def start_jlab(dask_scheduler):
    import subprocess
    proc = subprocess.Popen(['jupyter', 'lab', '--ip', host, '--no-browser'])
    dask_scheduler.jlab_proc = proc

if __name__ == "__main__":
	client = Client(scheduler_file='scheduler.json')
	host = client.run_on_scheduler(socket.gethostname)
	client.run_on_scheduler(start_jlab)

	print("ssh -N -L 8888:%s:8888 cheyenne.ucar.edu" % (host))
