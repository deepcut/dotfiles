export ASDF_DIR=$(brew --prefix asdf)
. $(brew --prefix asdf)/asdf.sh

[ -f "/Users/fei/.shopify-app-cli/shopify.sh" ] && source "/Users/fei/.shopify-app-cli/shopify.sh"

export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"

