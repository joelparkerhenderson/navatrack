# Navatrack

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## How to build this project

Create a new project:

```sh
mix igniter.new navatrack --with phx.new --install ash,ash_phoenix,ash_admin,ash_csv,ash_ai,ash_geo,ash_graphql,ash_json_api,ash_oban,ash_postgres,ash_state_machine,backpex,ash_backpex
cd navatrack
mix ash.setup
mix cinder.install
```

## Authentication

Create a user with authentication magic link:

```sh
mix ash.gen.domain Navatrack.Accounts
mix igniter.install ash_authentication_phoenix --auth-strategy magic_link
mix ash.migrate
```

## Resources

Resources that we prefer to create:

- [User](doc/user/)
- [Organization](doc/organization/)
- [Initiative](doc/initiative/)

## Update

Run:

```sh
mix deps.update --all
```

Clean recompile:

```sh
mix clean
mix deps.update --all
mix deps.clean --all
mix deps.get
mix compile
```

Check dependency trees:

```sh
mix deps.tree | grep -E "(ash|reactor|spark)"
```

## Update deps versions

Download:

```sh
mkdir -p lib/mix/tasks/
curl "https://raw.githubusercontent.com/joelparkerhenderson/elixir-mix-task-to-update-deps-versions/refs/heads/main/update_deps_versions.ex" \
   -o lib/mix/tasks/update_deps_versions.ex
```

Dry run:

```sh
mix update_deps_versions --dry-run
```

Wet run:

```sh
mix update_deps_versions
```

## Update resource diagrams

Run:

```sh
mix ash.generate_resource_diagrams
```
