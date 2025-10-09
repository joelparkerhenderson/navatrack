# Ash Authentication Phoenix Overrides

## Create customization

Edit the auto-generated file `lib/NavatrackWeb/AuthOverrides.exs`.

```elixir
defmodule NavatrackWeb.AshAuthenticationPhoenixOverrides do
  use AshAuthentication.Phoenix.Overrides

  # configure your UI overrides here

  # First argument to `override` is the component name you are overriding.
  # The body contains any number of configurations you wish to override
  # Below are some examples

  # For a complete reference, see https://hexdocs.pm/ash_authentication_phoenix/ui-overrides.html

  # override AshAuthentication.Phoenix.Components.Banner do
  #   set :image_url, "https://media.giphy.com/media/g7GKcSzwQfugw/giphy.gif"
  #   set :text_class, "bg-red-500"
  # end

  # override AshAuthentication.Phoenix.Components.SignIn do
  #  set :show_banner, false
  # end

  override AshAuthentication.Phoenix.Components.Banner do
    set :image_url, nil
  end
end
```

## Verify router

View file `lib/navatrack_web/router.ex`.

Verify the presence of `NavatrackWeb.AuthOverrides` in the `sign_in_route` and the `reset_route`.

```elixir
overrides: [
  NavatrackWeb.AuthOverrides,
  AshAuthentication.Phoenix.Overrides.Default
]
```
