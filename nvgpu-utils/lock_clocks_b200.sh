sudo nvidia-persistenced --uvm-persistence-mode
sudo nvidia-smi -i $1 -lgc 1590,1590
# sudo nvidia-smi -pl 1000 -i $1
