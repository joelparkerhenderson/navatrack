defmodule Navatrack.Accounts.AccessPermission do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Accounts.AccessPermission.Actions,
      Navatrack.Accounts.AccessPermission.Attributes,
    ]
  use Navatrack.Accounts.AccessPermission.Fab

  def snake_case_singular(), do: "access_permission"
  def snake_case_plural(), do: "access_permissions"
  def title_case_singular(), do: "Access Permission"
  def title_case_plural(), do: "Access Permissions"

  postgres do
    table "access_permissions"
    repo Navatrack.Repo
  end

  relationships do
    belongs_to :access_attribute, Navatrack.Accounts.AccessAttribute
    belongs_to :access_operation, Navatrack.Accounts.AccessOperation
  end

end
