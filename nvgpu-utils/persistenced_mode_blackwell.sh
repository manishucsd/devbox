# !/bin/bash
# https://docs.nvidia.com/deploy/driver-persistence/index.html
sudo nvidia-persistenced --uvm-persistence-mode


# Note that the legacy persistence mode (-pm) doesn't work on Blackwell GPUs.
# sudo nvidia-smi -pm 1 -i $1 --- IGNORE ---
