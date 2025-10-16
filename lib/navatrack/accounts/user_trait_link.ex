defmodule Navatrack.Accounts.UserTraitLink do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication]

  def snake_case_singular(), do: "user_trait_link"
  def snake_case_plural(), do: "user_trait_links"
  def title_case_singular(), do: "User Trait Link"
  def title_case_plural(), do: "User Trait Links"

  postgres do
    table "user_trait_links"
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
      :trait_id,
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
    belongs_to :trait, Navatrack.Works.Trait, primary_key?: true, allow_nil?: false
  end
end
