[
  import_deps: [
    :ash_authentication,
    :ash_authentication_phoenix,
    :backpex,
    :ash_state_machine,
    :ash_postgres,
    :ash_oban,
    :oban,
    :ash_json_api,
    :ash_graphql,
    :absinthe,
    :ash_ai,
    :ash_admin,
    :ash_phoenix,
    :ash,
    :reactor,
    :ecto,
    :ecto_sql,
    :phoenix
  ],
  subdirectories: ["priv/*/migrations"],
  plugins: [Absinthe.Formatter, Spark.Formatter, Phoenix.LiveView.HTMLFormatter],
  inputs: ["*.{heex,ex,exs}", "{config,lib,test}/**/*.{heex,ex,exs}", "priv/*/seeds.exs"]
]
