######
# Script for fixing brew between M1 & Intel
######
arch_name="$(uname -m)"

if [ "${arch_name}" = "x86_64" ]; then
    if [ "$(sysctl -in sysctl.proc_translated)" = "1" ]; then
        echo "Running on Rosetta 2"
        ARM=0
    else
        echo "Running on native Intel"
        ARM=0
    fi
elif [ "${arch_name}" = "arm64" ]; then
    echo "Running on ARM"
    ARM=1
else
    echo "Unknown architecture: ${arch_name}"
fi
echo "Arm Status: $ARM, $arch_name"

#Shellscript updates, imports from .bash_profile
#set PYTHONIOENCODING=UTF-8


# brew path
if [ $ARM -eq 0 ]; then
    # intel
    echo "Rosetta2"
    # homebrew
    export PATH="/opt/local/bin:$PATH"
    # homebrew python
    export PATH="/usr/local/opt/python@3.9/libexec/bin:$PATH"
    export PATH="/usr/local/lib/python3.9/site-packages:$PATH"
    export PLAT="ROSETTA2"
    alias brew='arch -x86_64 /usr/local/bin/brew'
    alias virtualenv='arch -x86_64 python -m virtualenv ~/venvs/%*'
    export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
else
    echo "M1 Native!"
    # Homebrew
    export PATH="/opt/homebrew/bin:$PATH"
    # Homebrew - Python
    export PATH="/opt/homebrew/opt/python@3.9/libexec/bin:$PATH"
    export PATH="/opt/homebrew/lib/python3.9/site-packages:$PATH"
    # OpenSSH
    export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
    export PLAT="M1"
    alias brew='arch -arm64e /opt/homebrew/bin/brew'
    alias virtualenv='arch -arm64e python -m virtualenv ~/venvs/$*'
fi
