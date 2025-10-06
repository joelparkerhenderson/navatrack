defmodule Navatrack.Accounts.UserInitiativeLink do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication]

  def singular_snake_case(), do: "user_initiative_link"
  def plural_snake_case(), do: "user_initiative_links"
  def singular_title_case(), do: "User Initiative Link"
  def plural_title_case(), do: "User Initiative Links"

  postgres do
    table "user_initiative_links"
    repo Navatrack.Repo
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User, primary_key?: true, allow_nil?: false
    belongs_to :initiative, Navatrack.Works.Initiative, primary_key?: true, allow_nil?: false
  end

  actions do
    defaults [:read, :destroy, create: :*, update: :*]
  end
end
