# Debug

Edit file [`config/dev.exs`](config/dev.exs) to configure Ash debugging:

```elixir
# Enable Ash framework debug messages
config :ash,
  debug?: true
```

In the file, also edit the logger line to make sure the level is debug:

```elixir
# Do not include metadata nor timestamps in development logs
config :logger,
  :default_formatter,
  format: "[$level] $message\n",
  level: :debug,
  truncate: :infinity
```
