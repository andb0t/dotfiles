if "$VERBOSE"; then
    echo "Load $0 -> $(readlink -f $0)"
fi

#this is to avoid QT library problem in clic setup
# export LD_LIBRARY_PATH=/usr/lib64:$LD_LIBRARY_PATH #enabling this fixes the command line programs but breaks CLIC setup

#this is a hack to make command line programs run anyway
function konsole
{
  LD_LIBRARY_PATH=/usr/lib64 command konsole
}
function kolourpaint
{
  LD_LIBRARY_PATH=/usr/lib64 command kolourpaint
}
function okular
{
  LD_LIBRARY_PATH=/usr/lib64 command okular
}
function klayout
{
  LD_LIBRARY_PATH=/usr/lib64 command klayout
}
function akonadiconsole
{
  LD_LIBRARY_PATH=/usr/lib64 command akonadiconsole
}

#
#--General
#
alias   windows='xfreerdp --no-nla -a 16 -u $USER -k en-us -T "Windows" -d CERN -g 1600x1100 cerntsnew.cern.ch'
alias   startup='nohup ~/.dropbox-dist/dropboxd &'
unalias watch  # defined alias using watch --colors option doesn't work here
#
#--ROOT
#
alias root='root -l'
#
#--Computing
#
alias ssh_gpu="ssh $USER@pclcdgpu"
alias ssh_hadoop='ssh hadalytic'
#
#--Dirac
#
alias        dirac_get='dirac-wms-job-get-output'
alias         dirac_ls='dirac-dms-find-lfns'
alias    dirac_ls_user='dirac-dms-user-lfns'
alias      dirac_clean="find . -name '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' -exec mv -t $TRASH {} +"
#
#--CLIC
#
alias    cmakeclic='cmake -C $ILCSOFT/ILCSoft.cmake -DBoost_NO_BOOST_CMAKE=ON -DCMAKE_C_COMPILER=`which gcc` -DCMAKE_CXX_COMPILER=`which g++` -DCMAKE_CXX_FLAGS="-std=c++11 -Wall" ..'
alias cmakenewclic='cmakeclean && cmakeclic ..'

#exports
USER_INITIAL="$(echo $USER | head -c 1)"
export DROPBOX="$HOME/private/Dropbox"
export STORAGE="/afs/cern.ch/work/$USER_INITIAL/$USER/"
export TRASH="/afs/cern.ch/work/$USER_INITIAL/$USER/trash"
export CERNBOX="/eos/user/$USER_INITIAL/$USER"
export EOS="/eos/experiment/clicdp/grid/ilc/user/$USER_INITIAL/$USER/"

#access eos
eosfusebind

#latex
prepend_path "/afs/cern.ch/sw/XML/texlive/2016/bin/x86_64-linux"

#cmake
prepend_path "/cvmfs/clicdp.cern.ch/software/CMake/3.5.2/x86_64-slc6-gcc48-opt/bin"

#root
export ROOTSYS="/cvmfs/clicdp.cern.ch/software/ROOT/6.08.00/x86_64-slc6-gcc62-opt"
export PYTHONPATH="$ROOTSYS/lib:$PYTHONPATH"
prepend_path "$ROOTSYS/bin"
export LD_LIBRARY_PATH="$ROOTSYS/lib:$LD_LIBRARY_PATH"

# new doxygen
prepend_path "/cvmfs/clicdp.cern.ch/software/Doxygen/1.8.13/x86_64-slc6-gcc62-opt/bin/"

#gcc and g++
prepend_path /cvmfs/clicdp.cern.ch/compilers/gcc/6.2.0/x86_64-slc6/bin
export LD_LIBRARY_PATH=/cvmfs/clicdp.cern.ch/compilers/gcc/6.2.0/x86_64-slc6/lib64:/cvmfs/clicdp.cern.ch/compilers/gcc/6.2.0/x86_64-slc6/lib:"$LD_LIBRARY_PATH}"

# clang compiler and corresponding binaries
source /cvmfs/clicdp.cern.ch/compilers/llvm/4.0.1/x86_64-slc6/setup.sh
#clang-tidy in LLVM needs python
prepend_path /cvmfs/clicdp.cern.ch/software/Python/2.7.12/x86_64-slc6-gcc62-opt/bin
export LD_LIBRARY_PATH=/cvmfs/clicdp.cern.ch/software/Python/2.7.12/x86_64-slc6-gcc62-opt/lib:${LD_LIBRARY_PATH}

# gdb
prepend_path /cvmfs/sft.cern.ch/lcg/external/gdb/7.6/x86_64-slc6-gcc48-opt/bin

#git
prepend_path /cvmfs/clicdp.cern.ch/software/git/2.13.2/x86_64-slc6-gcc7-opt/bin
export MANPATH=/cvmfs/clicdp.cern.ch/software/git/2.13.2/x86_64-slc6-gcc7-opt/share/man:${MANPATH}
source ~/git-completion.bash
source $DOTFILES_DIR/zsh/prompt.zsh  # resource because standard git version too old

#Python 2.7
export PYTHONPATH=$HOME/.local/lib/python2.7/site-packages:$PYTHONPATH

# pip
prepend_path "$HOME/.local/bin"

# Spark
export PYSPARK_DRIVER_PYTHON=ipython

#Python 3.5
export PYTHON2_PYTHONDIR=$PYTHONDIR
export PYTHON2_PYTHONPATH=$PYTHONPATH
export PYTHON2_PATH=$PATH
export PYTHON2_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export PYTHON3_PYTHONDIR=/cvmfs/clicdp.cern.ch/software/Python/3.5.2/x86_64-slc6-gcc61-opt
export PYTHON3_PYTHONPATH=$HOME/.local/lib/python3.5/site-packages/
export PYTHON3_PATH=$HOME/.local/bin:$PYTHON3_PYTHONDIR/bin:$PATH
export PYTHON3_LD_LIBRARY_PATH=$PYTHON3_PYTHONDIR/lib:$LD_LIBRARY_PATH
set_python2(){
	echo "Setting python2 paths"
	export PYTHONPATH=$PYTHON2_PYTHONPATH
	export PYTHONDIR=$PYTHON2_PYTHONDIR
	export PATH=$PYTHON2_PATH
	export LD_LIBRARY_PATH=$PYTHON2_LD_LIBRARY_PATH
}
set_python3(){
	echo "Setting python3 paths"
	export PYTHONPATH=$PYTHON3_PYTHONPATH
	export PYTHONDIR=$PYTHON3_PYTHONDIR
	export PATH=$PYTHON3_PATH
	export LD_LIBRARY_PATH=$PYTHON3_LD_LIBRARY_PATH
}
python3(){
	set_python3
	echo "Execute python3 $@"
	$PYTHON3_PYTHONDIR/bin/python3 "$@"
	set_python2
}
pip3(){
	set_python3
	echo "Execute pip3 $@"
	$PYTHON3_PYTHONDIR/bin/pip3 "$@"
	set_python2
}

# ILCSOFT packages
clic_init() {
    echo "Initializing ILCSOFT packages..."
    unset MARLIN_DLL
    source /cvmfs/clicdp.cern.ch/iLCSoft/builds/2017-11-15/x86_64-slc6-gcc62-opt/init_ilcsoft.sh
    # Use my own MarlinReco
    pathrm MarlinReco MARLIN_DLL
    export MARLIN_DLL=$HOME/projects/MarlinReco/lib/libMarlinReco.so:$MARLIN_DLL
    # Add my other processors
    export MARLIN_DLL=$HOME/projects/CLIC_analysis/processors/NtupleMaker/lib/libNtupleMaker.so:$MARLIN_DLL
    echo "Warning: this breaks DIRAC packages! Open a new shell to reset!"
}
# DIRAC packages
dirac_init() {
    echo "Initializing DIRAC packages..."
    source /cvmfs/clicdp.cern.ch/DIRAC/bashrc
    cd $HOME/projects/CLIC_analysis/grid
    echo "Warning: separate python version loaded! Execute \"set_python2\" to reset it!"
    dirac-proxy-init -g ilc_user
}

# keep paths free of duplicates
typeset -U PATH
typeset -U PYTHONPATH
typeset -U PYTHONDIR
typeset -U LD_LIBRARY_PATH
