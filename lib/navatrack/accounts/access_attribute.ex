defmodule Navatrack.Accounts.AccessAttribute do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Accounts.AccessAttribute.Actions,
      Navatrack.Accounts.AccessAttribute.Attributes,
    ]
  use Navatrack.Accounts.AccessAttribute.Fab

  def snake_case_singular(), do: "access_attribute"
  def snake_case_plural(), do: "access_attributes"
  def title_case_singular(), do: "Access Attribute"
  def title_case_plural(), do: "Access Attributes"

  postgres do
    table "access_attributes"
    repo Navatrack.Repo
  end

  relationships do
    has_many :access_assignments, Navatrack.Accounts.AccessAssignment
    has_many :access_permissions, Navatrack.Accounts.AccessPermission
  end

end
