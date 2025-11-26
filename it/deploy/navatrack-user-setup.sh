#!/bin/sh

# Navatrack user setup script for a typical Unix Debian/Ubuntu system.

mkdir -p ~/.config
mkdir -p ~/.config/ghostty
mkdir -p ~/.config/mise
mkdir -p ~/bin
mkdir -p ~/doc
mkdir -p ~/git
mkdir -p ~/log
mkdir -p ~/opt
mkdir -p ~/tmp

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Elixir tools
mix local.hex --force
mix local.rebar --force

# Clone Navatrack repo and get dependencies
mkdir ~/git && cd $_
git clone https://github.com/joelparkerhenderson/navatrack.git
cd navatrack
mix deps.get

# Warning
warning: the dependency :absinthe requires Elixir "~> 1.15" but you are running on v1.14.0
warning: the dependency :fine requires Elixir "~> 1.15" but you are running on v1.14.0
warning: the dependency :spitfire requires Elixir "~> 1.15" but you are running on v1.14.0
warning: the dependency :yaml_elixir requires Elixir "~> 1.18" but you are running on v1.14.0
