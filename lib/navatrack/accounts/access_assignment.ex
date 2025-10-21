defmodule Navatrack.Accounts.AccessAssignment do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer

  def snake_case_singular(), do: "access_assignment"
  def snake_case_plural(), do: "access_assignments"
  def title_case_singular(), do: "Access Assignment"
  def title_case_plural(), do: "Access Assignments"

  postgres do
    table "access_assignments"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read, :destroy, :create, :update]
    default_accept [
      ### meta
      :created_at,
      :updated_at,
      :deleted_at,
      :locale_code,
      :parent_id,
      :parent_order,
      ### relationships
      :user_id,
      :access_attribute_id
    ]
  end

  attributes do
    ### meta
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :locale_code, :string
    attribute :parent_id, :uuid
    attribute :parent_order, :integer
    ### relationships
    attribute :user_id, :uuid
    attribute :access_attribute_id, :uuid
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User
    belongs_to :access_attribute, Navatrack.Accounts.AccessAttribute
  end

  def fake(map \\ %{}) do
    Map.merge(
      %{
        user_id: nil,
        access_attribute_id: nil
      },
      map
    )
  end

end
