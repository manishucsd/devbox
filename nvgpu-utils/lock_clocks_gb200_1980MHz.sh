sudo nvidia-persistenced --uvm-persistence-mode
sudo nvidia-smi -i $1 -lgc 1980,1980
sudo nvidia-smi -pl 1200 -i $1
