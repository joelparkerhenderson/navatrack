defmodule Navatrack.Accounts.UserTaskLink do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication]

  def singular_snake_case(), do: "user_task_link"
  def plural_snake_case(), do: "user_task_links"
  def singular_title_case(), do: "User Task Link"
  def plural_title_case(), do: "User Task Links"

  postgres do
    table "user_task_links"
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
      :task_id,
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
    belongs_to :task, Navatrack.Works.Task, primary_key?: true, allow_nil?: false
  end

end
