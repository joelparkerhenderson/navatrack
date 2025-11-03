defmodule Navatrack.Accounts.AccessAssignment do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Accounts.AccessAssignment.Actions,
      Navatrack.Accounts.AccessAssignment.Attributes,
    ]
  use Navatrack.Accounts.AccessAssignment.Fab

  def snake_case_singular(), do: "access_assignment"
  def snake_case_plural(), do: "access_assignments"
  def title_case_singular(), do: "Access Assignment"
  def title_case_plural(), do: "Access Assignments"

  postgres do
    table "access_assignments"
    repo Navatrack.Repo
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User
    belongs_to :access_attribute, Navatrack.Accounts.AccessAttribute
  end

end
