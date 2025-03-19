# Migration from asdf to mise

This repository has been migrated from [asdf](https://asdf-vm.com/) to [mise](https://mise.jdx.dev/) for managing tool versions. Mise is a faster, more modern alternative to asdf with backwards compatibility.

## Changes Made

1. Added `bin/install-mise` script to handle installation and setup
2. Updated `bin/install-rubies` to use mise instead of asdf
3. Updated `.bashrc` to comment out asdf hooks and add mise activation
4. Updated `bootstrap.sh` to use mise instead of asdf
5. Added `mise.toml` configuration (which replaces `.tool-versions`)
6. Updated `Brewfile` to install mise instead of asdf

## Migrating Existing Installations

If you have an existing installation using asdf, you can migrate to mise by:

1. Install mise: `brew install mise`
2. Run `mise install` to import existing tools from asdf
3. Add `eval "$(mise activate bash)"` to your shell configuration
4. Optionally, remove asdf: `brew uninstall asdf`

## Features of mise

- Faster tool installation and switching
- Backwards compatibility with asdf's `.tool-versions` files
- Supports TOML configuration
- Built-in hooks for plugin management
- Written in Rust for better performance
- Supports all the same languages and tools as asdf

## Configuration

The mise configuration is stored in:
- `mise.toml` in the project root (replaces `.tool-versions`)
- `~/.config/mise/config.toml` for global settings
- `$HOME/.default-gems` for Ruby gems to install automatically (same location as asdf used) 