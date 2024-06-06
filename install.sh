#!/usr/bin/env sh

info_printf() {
	printf "%s\n" "$(tput bold)[ $(tput setaf 2)INFO$(tput sgr0) ]$(tput sgr0) $1"
}

error_printf() {
	printf "%s\n" "$(tput bold)[ $(tput setaf 1)ERROR$(tput sgr0) ]$(tput sgr0) $1"
}


if [ "$(id -u)" -ne 0 ]; then
	error_printf "Please run this script as superuser"
	exit 1
fi

# Enter where this script is located
cd "$(dirname "$0")" || exit

for namespace_directory in */; do
	for script in "$namespace_directory"*; do
		if [ ! -f "$script" ]; then
			continue
		fi

		script_filename=$(basename "$script")

		# Skip the file if it's a MARKDOWN file
		if [ "${script_filename##*.}" = "md" ]; then
			continue
		fi

		# Remove file extension
		script_filename="${script_filename%.*}"

		if [ "$namespace_directory" = "no-namespace/" ]; then
			command_name=$script_filename
		else
			namespace=$(printf "%s" "$namespace_directory" | sed "s/\//-/g")
			command_name=$namespace$script_filename
		fi

		command_path=/usr/local/bin/"$command_name"

		info_printf "Installing \"$command_name\" script"
    rm -f "$command_path"
		cp "$script" "$command_path"
		chmod 755 "$command_path"
	done
done

info_printf "Done!"
