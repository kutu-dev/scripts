# Kutu's Unix scripts collection
> A set of scripts created by me  for a better terminal experience.

## What are this scripts?
A set of handmade scripts that I use daily. From a general Unix use to a more specific and perhaps OS dependent ones.

## Installing
```bash
> git clone https://github.com/kutu-dev/scripts.git
> cd scripts
> chmod u+x install.sh
> sudo ./install.sh
```

`install.sh` will only move all the scripts storaged in the scripts directory and move them to `/usr/local/bin/`, so you can add your personal scripts and rerun this script to easily manage and install them.

Some scripts may not work, since `install.sh` **doesn't** install the necessary dependencies, they are listed in `dependencies.txt`. This behavior is intentional to avoid interfering and breaking dependencies on other programs (for example not installing python packages in the virtual env).

## Contributing
Feel free to report a bug or request a branch merge, I appreciate any contribution.

## Author

Created with :heart: by [Kutu](https://kutu-dev.github.io/).
> - GitHub - [kutu-dev](https://github.com/kutu-dev)
> - Twitter - [@kutu_dev](https://twitter.com/kutu_dev)

