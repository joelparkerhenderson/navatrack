defmodule Navatrack.Accounts.UserUkGdadPcfRoleLink do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication],
    fragments: [
      Navatrack.Accounts.UserUkGdadPcfRoleLink.Actions,
      Navatrack.Accounts.UserUkGdadPcfRoleLink.Attributes,
    ]
  use Navatrack.Accounts.UserUkGdadPcfRoleLink.Fab

  def snake_case_singular(), do: "user_uk_gdad_pcf_role_link"
  def snake_case_plural(), do: "user_uk_gdad_pcf_role_links"
  def title_case_singular(), do: "User UK GDAD PCF Role Link"
  def title_case_plural(), do: "User UK GDAD PCF Role Links"

  postgres do
    table "user_uk_gdad_pcf_role_links"
    repo Navatrack.Repo
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User, primary_key?: true, allow_nil?: false
    belongs_to :uk_gdad_pcf_role, Navatrack.Codes.UkGdadPcfRole, primary_key?: true, allow_nil?: false
  end

  # TODO tighten
  policies do
    policy always() do
      authorize_if always()
    end
  end

end
