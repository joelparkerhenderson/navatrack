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

  actions do
    defaults [:read, :destroy, create: :*, update: :*]

    default_accept [
      :created_at,
      :updated_at,
      :deleted_at,
      :locale_code,
      :user_id,
      :initiative_id,
    ]
  end

  attributes do
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :locale_code, :string
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User, primary_key?: true, allow_nil?: false
    belongs_to :initiative, Navatrack.Works.Initiative, primary_key?: true, allow_nil?: false
  end

end
