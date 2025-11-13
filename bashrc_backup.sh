#
# Display Git branch in Terminal
#
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

#
# Set Path Shortcuts
#

# SELECT WORKSPACE
WORKSPACE=$HOME


# SELECT REPOSITORIES
REPOS=$WORKSPACE/repos


# Local sdk path
SDK=$WORKSPACE/sdk
CUDA=$SDK/cuda


# CUDA toolkits
CUDA_12_8_0=$CUDA/12.8.0


# Select one version of CUDA toolkit
CUDA_CURRENT=$CUDA_12_8_0


# Derived environment variables
export CUDACXX=$CUDA_CURRENT/bin/nvcc


# ADD CUDA_CURRENT TO PATH and LD_LIBRARY_PATH
export PATH="$CUDA_CURRENT/bin:$PATH"
export LD_LIBRARY_PATH="$CUDA_CURRENT/lib64:$LD_LIBRARY_PATH"

#
# Set Command Shortcuts
#

# General Bash/Shell 
alias cls='clear'

# NVIDIA
alias nsmi='nvidia-smi'

# Task command aliases
alias t='task'                                   # shorthand for `task`
alias tl='task --list'                           # list tasks

# Poetry command shortcuts
alias pos='poetry shell'                         # open Poetry virtualenv
alias pod='deactivate'                           # deactivate  

# Git command shortcuts
alias gss='git status -sb'                       # short, concise status
alias gs='git status'                            # status
alias ga='git add'                               # add files
alias gaa='git add -A'                           # add all changes
alias gb='git branch'                            # list branches
alias gba='git branch -a'                        # list all (local + remote)
alias gc='git commit -m'                         # commit with message
alias gca='git commit -a -m'                     # commit tracked + message
alias gco='git checkout'                         # checkout branch/file
alias gcb='git checkout -b'                      # create + switch new branch
alias gd='git diff'                              # show unstaged diffs
alias gds='git diff --staged'                    # show staged diffs
alias gl='git log --oneline --graph --decorate'  # beautiful log
alias gll='git log --stat --abbrev-commit'       # detailed log

#
# Navigation functions 
#

# cutlass
tocutlass() {
 echo "cd $REPOS/cutlass/cutlass_tree_$1/cutlass"
 cd $REPOS/cutlass/cutlass_tree_$1/cutlass
}


tocutlassbuild() {
 echo "cd $REPOS/cutlass/cutlass_tree_$1/build"
 cd $REPOS/cutlass/cutlass_tree_$1/build
}

#
# Python environment setup
#

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
