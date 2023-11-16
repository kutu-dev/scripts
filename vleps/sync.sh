#!/usr/bin/env sh

info_printf() {
	printf "%s\n" "$(tput bold)[ $(tput setaf 2)INFO$(tput sgr0) ]$(tput sgr0) $1"
}

# Enter the root of the repositories
cd "$HOME"/documents/void-repositories || exit

info_printf "Resetting main repository"
cd void-packages || exit
git clean -qfd
git reset -q --hard
git pull -q --rebase upstream master
git checkout -q master
cd ..

for repository in extra-packages/*; do
	if [ -d "$repository"/.git ]; then
		cd "$repository" || exit
		info_printf "Resetting $(basename "$repository") repository"
		git clean -qfd
		git reset -q --hard
		git pull -q origin master
		git checkout -q master
		cd ../..
	fi

	if [ -f "$repository"/common/shlibs ]; then
		info_printf "Adding extra shared libraries from $(basename "$repository") repository"
		cat "$repository"/common/shlibs >>void-packages/common/shlibs
	fi

	for package in "$repository"/srcpkgs/*; do
		info_printf "Adding package $(basename "$package")"
		cp -r "$package" void-packages/srcpkgs
	done
done

info_printf "Done!"
