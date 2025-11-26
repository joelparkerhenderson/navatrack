#!/bin/sh

# Use Mise to set up various development tools on a typical Unix Debian/Ubuntu system.
# Warning: this currently fails on a fresh Debian VPS. TODO fix it.

mise use node@latest
mise use erlang@latest
mise use elixir@latest
mise use postgres@latest
