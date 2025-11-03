defmodule Navatrack.Accounts.UserEventLink do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication],
    fragments: [
      Navatrack.Accounts.UserEventLink.Actions,
      Navatrack.Accounts.UserEventLink.Attributes,
    ]
  use Navatrack.Accounts.UserEventLink.Fab

  def snake_case_singular(), do: "user_event_link"
  def snake_case_plural(), do: "user_event_links"
  def title_case_singular(), do: "User Event Link"
  def title_case_plural(), do: "User Event Links"

  postgres do
    table "user_event_links"
    repo Navatrack.Repo
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User, primary_key?: true, allow_nil?: false
    belongs_to :event, Navatrack.Works.Event, primary_key?: true, allow_nil?: false
  end

  # TODO tighten
  policies do
    policy always() do
      authorize_if always()
    end
  end

end
