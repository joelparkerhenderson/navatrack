defmodule Navatrack.Accounts.AccessOperation do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Accounts.AccessOperation.Actions,
      Navatrack.Accounts.AccessOperation.Attributes,
    ]
  use Navatrack.Accounts.AccessOperation.Fab

  def snake_case_singular(), do: "access_operation"
  def snake_case_plural(), do: "access_operations"
  def title_case_singular(), do: "Access Operation"
  def title_case_plural(), do: "Access Operations"

  postgres do
    table "access_operations"
    repo Navatrack.Repo
  end

  relationships do
    has_many :access_permissions, Navatrack.Accounts.AccessPermission
  end

end
