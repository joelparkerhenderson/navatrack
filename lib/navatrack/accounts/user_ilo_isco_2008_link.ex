defmodule Navatrack.Accounts.UserIloIsco2008Link do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication],
    fragments: [
      Navatrack.Accounts.UserIloIsco2008Link.Actions,
      Navatrack.Accounts.UserIloIsco2008Link.Attributes,
    ]
  use Navatrack.Accounts.UserIloIsco2008Link.Fab

  def snake_case_singular(), do: "user_ilo_isco_2008_link"
  def snake_case_plural(), do: "user_ilo_isco_2008_links"
  def title_case_singular(), do: "User Lumina Foundation Skill Level Link"
  def title_case_plural(), do: "User Lumina Foundation Skill Level Links"

  postgres do
    table "user_ilo_isco_2008_links"
    repo Navatrack.Repo
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User, primary_key?: true, allow_nil?: false
    belongs_to :ilo_isco_2008, Navatrack.Codes.IloIsco2008, primary_key?: true, allow_nil?: false
  end

  # TODO tighten
  policies do
    policy always() do
      authorize_if always()
    end
  end

end
