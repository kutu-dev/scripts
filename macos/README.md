# MacOS (macos)
> Scripts that use MacOS specify commands and systems.

## How to use it
## The `macos-random-change-wallpaper` command
Select a random file from the `$HOME/Pictures/wallpapers` directory and sets it as the backgroung image in the Finder.

The scripts also takes in count subdirectories when selecting the wallpaper, so with the following directory structure:

```
$HOME/Pictures/wallpapers/
└── foo.png/
    └── bar/
        └── baz.jpeg
```

In this setup the file `foo.png` **or** the file `baz.jpeg` will be applied as the background image.

> [!CAUTION]
> This scripts doesn't expect non-image files in the `wallpapers` directory, the only files ignored are the ones named `.DS_Store`, so you'll need to keep this directory clean of non-valid files.
