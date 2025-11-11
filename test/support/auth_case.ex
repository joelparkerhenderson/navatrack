defmodule NavatrackWeb.AuthCase do
  @moduledoc """
  This module defines the test case to be used by tests that require setting up
  authentication.

  This example is developed for a typical resource "User" and "Item", and uses
  AshAuthentication magic link strategy, with a default setup of user email
  address. Modify this example as you wish for your own needs and settings.

  This code is extracted from contactopensource and is in the public domain.
  I appreciate any constructive user_review and advice on how to improve this code.
  And I'm happy to answer questions. Email joel@joelparkerhenderson.com.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      alias Navatrack.Accounts.User

      def my_user() do
        User
        |> Ash.Changeset.for_create(:create, %{email: "example@example.com"})
        |> Ash.create(upsert?: true, upsert_identity: :unique_email)
      end

      def my_sign_in(user) do
        strategy = AshAuthentication.Info.strategy!(User, :magic_link)
        {:ok, token} = AshAuthentication.Strategy.MagicLink.request_token_for(strategy, user)
        AshAuthentication.Strategy.action(strategy, :sign_in, %{"token" => token})
      end
    end
  end
end
