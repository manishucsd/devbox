sudo nvidia-persistenced --uvm-persistence-mode
sudo nvidia-smi -i $1 -lgc 1890,1890
sudo nvidia-smi -pl 1200 -i $1
