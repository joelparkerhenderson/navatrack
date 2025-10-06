defmodule Navatrack.Accounts.UserGroupLink do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication]

  def singular_snake_case(), do: "user_group_link"
  def plural_snake_case(), do: "user_group_links"
  def singular_title_case(), do: "User Group Link"
  def plural_title_case(), do: "User Group Links"

  postgres do
    table "user_group_links"
    repo Navatrack.Repo
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User, primary_key?: true, allow_nil?: false
    belongs_to :group, Navatrack.Works.Group, primary_key?: true, allow_nil?: false
  end

  actions do
    defaults [:read, :destroy, create: :*, update: :*]
  end
end
