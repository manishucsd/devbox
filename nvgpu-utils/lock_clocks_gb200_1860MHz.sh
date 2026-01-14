sudo nvidia-persistenced --uvm-persistence-mode
sudo nvidia-smi -i $1 -lgc 1860,1860
sudo nvidia-smi -pl 1200 -i $1
