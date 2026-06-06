# Mattdibi's init.lua

**Requirements**: ripgrep

Tested on Neovim v0.12.2

## Installing LSPs

To install LSPs use the system package manager (or what the documentation of the LSP tells you). Then update the `INSTALLED_LSPS` environment variable on your local machine.

The configuration expects to find an env var `INSTALLED_LSPS` which is a comma-separated list of strings containing the installed LSPs on the current machine. Given that this configuration is meant to be used with Dev Containers, we don't know beforehand what we can find in the environment.
