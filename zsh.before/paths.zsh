. /opt/homebrew/opt/asdf/asdf.sh
export ASDF_DIR=$(brew --prefix asdf)
. $(brew --prefix asdf)/asdf.sh

export PATH=".:$PATH"
# export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"
