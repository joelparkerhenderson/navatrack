defmodule Navatrack.Accounts.UserGroupLink do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication]

  def snake_case_singular(), do: "user_group_link"
  def snake_case_plural(), do: "user_group_links"
  def title_case_singular(), do: "User Group Link"
  def title_case_plural(), do: "User Group Links"

  postgres do
    table "user_group_links"
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
      :group_id,
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
    belongs_to :group, Navatrack.Works.Group, primary_key?: true, allow_nil?: false
  end

end
