#!/usr/bin/env sh

info_printf() {
	printf "%s\n" "$(tput bold)[ $(tput setaf 2)INFO$(tput sgr0) ]$(tput sgr0) $1"
}

packages_file_path=${XDG_CONFIG_HOME:-~/.config}/vleps/packages.txt

if [ ! -f "$packages_file_path" ]; then
	info_printf "No config file found in $packages_file_path, creating a new one"
	mkdir -p "$(dirname "$packages_file_path")"
	touch "$packages_file_path"
	exit 0
fi

info_printf "Syncing the packages repositories"
command vleps-sync

cd "$HOME/documents/void-repositories/void-packages" || exit
info_printf "Installing the bootstrap package"
./xbps-src binary-bootstrap

while IFS= read -r package || [ -n "$package" ]; do
	info_printf "Building $package package"
	./xbps-src pkg "$package"
	info_printf "Installing $package package"
	xi "$package"
done <"$packages_file_path"

info_printf "Done!"
