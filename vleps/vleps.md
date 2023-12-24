# Void Linux Extra Packages Scripts (VLEPS)
> Scripts for managing custom sources for packages in Void Linux.

## How it works
All the scripts works with the following directory structure.

```
$HOME/documents/void-repositories/
├── void-packages
└── extra-packages/
    ├── foo/
    │   ├── srcpkgs/
    │   │   ├── bar/
    │   │   │   └── template
    │   │   └── ...
    │   └── common/
    │       └── shlibs
    └── ...
```

The `void-packages` directory is expected to be a folk of the [official void packages repository](https://github.com/void-linux/void-packages) with a `upstream` remote that points to original repository [as it's explained in its contributing guide](https://github.com/void-linux/void-packages/blob/master/CONTRIBUTING.md#creating-updating-and-modifying-packages-in-void-by-yourself).

Each extra package subdirectory can have extra templates in the `srcpkgs` directory, with `shlibs` to be appended to the main repository.

### The `vleps-sync` command
1. This command will first pull to the `void-packages` repository and each extra-package if a `.git` directory is present in any of them.
2. Then it will copy all the templates available in the `extra-packages` subdirectories to the `srcpkgs` in `void-package`.
3. And finally it will append any `shlibs` found in the `extra-packages` subdirectories to the one located in `void-packages/common/shlibs`.

### The `vleps-install` command
1. This command will first call the `vleps-sync` command ti have an up-to-date version of the `void-packages` repository.
2. Then it runs the `xbps-src binary-bootstrap` script to set up an enviroment to build XBPS packages.
3. And finally it installs the packages listed in the plain text configuration file located in `$XDG_CONFIG_HOME/vleps/packages.txt`.

> [!CAUTION]
> As you can read, this script suit is destinated to improve the quality of life of managing custom XBPS packages. Because of this, the `packages.txt` file is **NOT** intended as a installed packages tracker, a deterministic package manager (like [Nix](https://nixos.org/) or [Guix](https://guix.gnu.org/)) is recommended this goal.
