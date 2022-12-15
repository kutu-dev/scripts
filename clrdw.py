#!/usr/bin/env python

from pathlib import Path
from shutil import rmtree
import sys

def main() -> None:
    download_dir: Path = Path(Path.home(), 'Downloads')
    files_and_dirs: list[Path] = [i for i in download_dir.glob('*')]
    
    # Remove .DS_Store from the download files list
    if Path(download_dir, '.DS_Store') in files_and_dirs:
        files_and_dirs.remove(Path(download_dir, '.DS_Store'))

    if len(files_and_dirs) == 0:
        print('Downloads directory is already empty')
        sys.exit(0)

    for i in files_and_dirs:
        if i.is_file():
            i.unlink()
        else:
            rmtree(i)
        print(f'\'{i}\' removed...')
    print('Downloads directory cleaned!')

if __name__ == '__main__':
    try:
        main()
    except PermissionError:
        print('Can not access to the downloads directory.')