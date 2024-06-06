<div align="center">
<h1>Kutu's Scripts</h1>

A collection of miscellaneous scripts for Unix-like systems.
</div>

## Installation
The only dependency at the moment is the `just` command (installation info at [its manual](https://just.systems/man/en/chapter_4.html)).

Some namespaces may have special needs and dependencies, check if they have an extra `README.md` file.

```sh
git clone https://github.com/kutu-dev/scripts.git
cd scripts
just install
```

Scripts are installed to `/usr/local/bin`, remember to add it to your `PATH`.

## Usage
The documentation for the commands is split by its namespace:
- [`macos`](macos/README.md)

If a namespace is missing documentation is because its scripts are self explanatory.

## How it works
All the scripts are located inside multiple directories, each one is a namespace. The only purpose of the namespaces is to minimize name collision with already installed commands.

When `install.sh` is run each command is prepended with its namespace and its extension is removed.

E.g.`macos/random-change-wallpaper.sh` -> `/usr/local/bin/macos-random-change-wallpaper`.

Namespaces can be nested, thus the path `example/foo/bar/command.sh` becomes `example-foo-bar-command`.

## Acknowledgements
Created with :heart: by [Jorge "Kutu" Dobón Blanco](https://dobon.dev).
