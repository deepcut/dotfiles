## Fresh Install

Clone the Repo
- `git clone git@github.com:fadhguru/dotfiles.git ~/.dotfiles`

Bootstrap Script
- `sh ./dotfiles/bin/new_laptop.sh`

## Updating

Re setup all symlinks
- `resymlink`

## Alias Docs

See `docs/aliases-git.md`

## Troubleshooting

If `gpg` command fails with `dirmngr` errors while installing `nodejs` via `asdf`, run the following:
- `sudo pkill dirmngr; dirmngr --debug-all --daemon --standard-resolver`
