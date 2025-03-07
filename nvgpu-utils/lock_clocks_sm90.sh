sudo nvidia-smi -pm 1 -i $1
sudo nvidia-smi -i $1 -lgc 1580,1580
sudo nvidia-smi -pl 700 -i $1

