defmodule Navatrack.Accounts.UserTaskLink do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication],
    fragments: [
      Navatrack.Accounts.UserTaskLink.Actions,
      Navatrack.Accounts.UserTaskLink.Attributes,
    ]
  use Navatrack.Accounts.UserTaskLink.Fab

  def snake_case_singular(), do: "user_task_link"
  def snake_case_plural(), do: "user_task_links"
  def title_case_singular(), do: "User Task Link"
  def title_case_plural(), do: "User Task Links"

  postgres do
    table "user_task_links"
    repo Navatrack.Repo
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User, primary_key?: true, allow_nil?: false
    belongs_to :task, Navatrack.Works.Task, primary_key?: true, allow_nil?: false
  end

  # TODO tighten
  policies do
    policy always() do
      authorize_if always()
    end
  end

end
