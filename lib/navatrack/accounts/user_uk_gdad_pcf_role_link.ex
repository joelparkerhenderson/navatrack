defmodule Navatrack.Accounts.UserUkGdadPcfRoleLink do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication]

  def singular_snake_case(), do: "user_uk_gdad_pcf_role_link"
  def plural_snake_case(), do: "user_uk_gdad_pcf_role_links"
  def singular_title_case(), do: "User UK GDAD PCF Role Link"
  def plural_title_case(), do: "User UK GDAD PCF Role Links"

  postgres do
    table "user_uk_gdad_pcf_role_links"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read, :destroy, create: :*, update: :*]
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User, primary_key?: true, allow_nil?: false

    belongs_to :uk_gdad_pcf_role, Navatrack.Codes.UkGdadPcfRole,
      primary_key?: true,
      allow_nil?: false
  end
end
