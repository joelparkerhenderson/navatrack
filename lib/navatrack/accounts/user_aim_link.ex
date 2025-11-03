defmodule Navatrack.Accounts.UserAimLink do
  use Ash.Resource,
    otp_app: :navatrack,

    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication],
    fragments: [
      Navatrack.Accounts.UserAimLink.Actions,
      Navatrack.Accounts.UserAimLink.Attributes,
    ]
  use Navatrack.Accounts.UserAimLink.Fab

  def snake_case_singular(), do: "user_aim_link"
  def snake_case_plural(), do: "user_aim_links"
  def title_case_singular(), do: "User Aim Link"
  def title_case_plural(), do: "User Aim Links"

  postgres do
    table "user_aim_links"
    repo Navatrack.Repo
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User, primary_key?: true, allow_nil?: false
    belongs_to :aim, Navatrack.Works.Aim, primary_key?: true, allow_nil?: false
  end

  # TODO tighten
  policies do
    policy always() do
      authorize_if always()
    end
  end

end
