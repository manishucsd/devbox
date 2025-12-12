sudo nvidia-persistenced --uvm-persistence-mode
sudo nvidia-smi -i $1 -lgc 1680,1680
sudo nvidia-smi -pl 1200 -i $1
