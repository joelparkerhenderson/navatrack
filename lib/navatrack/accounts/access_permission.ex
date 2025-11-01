defmodule Navatrack.Accounts.AccessPermission do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer

  def snake_case_singular(), do: "access_permission"
  def snake_case_plural(), do: "access_permissions"
  def title_case_singular(), do: "Access Permission"
  def title_case_plural(), do: "Access Permissions"

  postgres do
    table "access_permissions"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read, :destroy, :create, :update]
    default_accept [
      ### meta
      :created_at,
      :updated_at,
      :retired_at,
      :locale_code,
      :parent_id,
      :parent_order,
      ### relationships
      :access_attribute_id,
      :access_operation_id
    ]
  end

  attributes do
    ### meta
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :retired_at, :utc_datetime_usec
    attribute :locale_code, :string
    attribute :parent_id, :uuid
    attribute :parent_order, :integer
    ### relationships
    attribute :access_attribute_id, :uuid
    attribute :access_operation_id, :uuid
  end

  relationships do
    belongs_to :access_attribute, Navatrack.Accounts.AccessAttribute
    belongs_to :access_operation, Navatrack.Accounts.AccessOperation
  end

  def fab!(map \\ %{}) do
    map = Map.put_new_lazy(map, :access_attribute_id, fn -> Navatrack.Accounts.AccessAttribute.fab!().id end)
    map = Map.put_new_lazy(map, :access_operation_id, fn -> Navatrack.Accounts.AccessOperation.fab!().id end)
    __MODULE__ |> Ash.Changeset.for_create(:create, __MODULE__.fab_map(map)) |> Ash.create!()
  end

  def fab_map(map \\ %{}) do
    Map.merge(
      %{
        access_attribute_id: nil,
        access_operation_id: nil,
      },
      map
    )
  end

end
