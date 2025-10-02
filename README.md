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

Optionally add ash authentication debugging to the development environment; edit file `config/dev.exs` then add:

```elixir
config ​:ash_authentication​, ​debug_authentication_failures?:​ true
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

## Search

We implement simple search by using the Postgres trigram extension, named "pg_trgm".

Edit file `lib/navatrack/repo.ex`.

Find section `installed_extensions` then append `pg_trgm` like this:

```elixir
​def​ installed_extensions ​do​
   ​# Add extensions here, and the migration generator will install them.​
   [​"​​ash-functions"​, ​"citext", "​​pg_trgm"​]
​end​
```

Edit resource file `lib/navatrack/accounts/user.ex`.

Find section `postgres` then append `custom_indexes` like this:

```elixir
postgres ​do​
   …
   custom_indexes ​do​
      index ​"​(​name || ' ' || kind) gin_trgm_ops"​, ​name:​ ​"​users_index_trgm"​, ​using:​ ​"​​gin"​
   end
```

Run:

```sh
​​mix​​ ​​ash.codegen​​ users_name_index_trgm
​​mix​​ ​​ash.migrate
```

TODO: create code implementation

```elixir
define ​:search_users​, ​action:​ ​:search​, ​args:​ [​:query​]
```

Edit file `??`.

```elixir
​def​ handle_params(params, _url, socket) ​do​
   query_text = Map.get(params, ​"​​q"​, ​"​​"​) |> validate_query_text()
   sort_input_text = Map.get(params, ​"​​sort"​, ​"​​"​) |> validate_sort_input_text()
   query:​ [​sort_input:​ sort_by]
   users = Navatrack.Accounts.search_users!(query_text, ​query:​ [​sort_input:​ sort_input_text])

   socket =
​     socket
      |> assign(​:query_text, query_text)
      |> assign(​:sort_input_text​, sort_input_text)
      |> assign(​:users, artists)
      …
```

We use the Ash function `sort_input` because it's convenient: it takes a comma-separated string of fields to sort on, ascending by default, or descending by prefixing with minus. For example if our user resource has an attribute "name" and attribute "created_at", then we can search by name ascending and newest record by using "name,-created_at".

Edit the attributes to set any ones you want to work with the sort to be "public":

```elixir
attribute ​:name​, ​:string​ ​do​
   public? true
   …
​end
```

TODO: add HTML…

```heex
<​.​search_box query=​{@q}​ method=​"get"​ data-role=​"search"​ phx-submit=​"search"​ />
```

Add sort options for select box:

```elixir
defp​ sort_options ​do​
   [
      {​"​​name"​, ​"​​name"​}
      {​"newest"​, ​"​​-created_at"​},
      {​"oldest"​, ​"​​created_at"​},
   ]
​​end
```
