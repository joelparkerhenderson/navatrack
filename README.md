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
- [Product](doc/product/)
