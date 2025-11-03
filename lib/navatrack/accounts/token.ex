defmodule Navatrack.Accounts.Token do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication.TokenResource],
    fragments: [
      Navatrack.Accounts.Token.Actions,
      Navatrack.Accounts.Token.Attributes
    ]

  postgres do
    table "tokens"
    repo Navatrack.Repo
  end

  policies do
    bypass AshAuthentication.Checks.AshAuthenticationInteraction do
      description "AshAuthentication can interact with the token resource"
      authorize_if always()
    end
  end

end
