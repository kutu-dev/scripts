# Default recipe of the justfile
default: install

# Show this info message
help:
  just --list

# Install the scripts
install:
  ./install.sh

# Check if the project is following the guidelines
check:
  shellcheck *.sh
  shfmt -i 2 .
