# Kutu's Scrips
> A collection of miscellaneous script for Unix-like systems.

## Installation
Run the `ìnstall.sh` script to install all the scripts in the `/usr/local/bin/` path.

```sh
# git clone https://github.com/kutu-dev/scripts.git
# cd scripts
# ./install.sh
```

_Tip:_ Remember to add `/usr/local/bin/` to your shell `PATH`.

## Usage
The documentation for the commands is divided by its namespace:
- [`vleps`](vleps/vleps.md)
- [`macos`](macos/macos.md)

## How it works
All the scripts are located inside multiple directories, each one is a namespace. The only purpose of the namespaces is to minimize name collision with already installed commands.

When `install.sh` is run each command is prepended with its namespace and its extension is remove.
E.g.`vleps/sync.sh` -> `/usr/local/bin/vleps-sync`.

Namespaces can be nested, thus the path `example/foo/bar/command.sh` becomes`example-foo-bar-command`.


## Author
Created with :heart: by [Kutu](https://kutu-dev.github.io).
> - GitHub - [kutu-dev](https://github.com/kutu-dev)
> - Twitter - [@kutu_dev](https://twitter.com/kutu_dev)
