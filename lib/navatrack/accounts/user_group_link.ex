defmodule Navatrack.Accounts.UserGroupLink do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication],
    fragments: [
      Navatrack.Accounts.UserGroupLink.Actions,
      Navatrack.Accounts.UserGroupLink.Attributes,
    ]
  use Navatrack.Accounts.UserGroupLink.Fab

  def snake_case_singular(), do: "user_group_link"
  def snake_case_plural(), do: "user_group_links"
  def title_case_singular(), do: "User Group Link"
  def title_case_plural(), do: "User Group Links"

  postgres do
    table "user_group_links"
    repo Navatrack.Repo
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User, primary_key?: true, allow_nil?: false
    belongs_to :group, Navatrack.Works.Group, primary_key?: true, allow_nil?: false
  end

  # TODO tighten
  policies do
    policy always() do
      authorize_if always()
    end
  end

end
