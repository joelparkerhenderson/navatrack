# AshAuthentication magic link LiveView

```elixir
# How to test Elixir Phoenix Ash Authentication Magic Link LiveView.
#
# This example is developed for a typical resource "User" and "Item",
# and uses AshAuthentication with a default setup of user email address.
# Modify this example as you wish for your own needs and settings.
#
# I appreciate contructive feedback and advice on how to improve this.
# And I'm happy to answer questions. Email joel@joelparkerhenderson.com.
#
# This file is /test/my_app_web/controllers/items_test.exs

defmodule MyAppWeb.ItemsTest do
  import Phoenix.LiveViewTest
  use MyAppWeb.ConnCase
  alias MyApp.Accounts.User

  defp my_user() do
    User
    |> Ash.Changeset.for_create(:create, %{email: "example@example.com"})
    |> Ash.create(upsert?: true, upsert_identity: :unique_email)
  end

  defp my_sign_in(user) do
    strategy = AshAuthentication.Info.strategy!(User, :magic_link)
    {:ok, token} = AshAuthentication.Strategy.MagicLink.request_token_for(strategy, user)
    AshAuthentication.Strategy.action(strategy, :sign_in, %{"token" => token})
  end

  setup %{conn: conn} do
    {:ok, user} = my_user()
    {:ok, user} = my_sign_in(user)
    conn =
      conn
      |> Phoenix.ConnTest.init_test_session(%{})
      |> AshAuthentication.Plug.Helpers.store_in_session(user)

    {:ok, conn: conn}
  end

  test "index", %{conn: conn} do
    conn = get(conn, ~p"/items")
    response = html_response(conn, 200)
    assert response =~ "Items"
  end

end
```
