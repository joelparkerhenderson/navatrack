defmodule Navatrack.Accounts.UserTopicLink do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication],
    fragments: [
      Navatrack.Accounts.UserTopicLink.Actions,
      Navatrack.Accounts.UserTopicLink.Attributes,
    ]
  use Navatrack.Accounts.UserTopicLink.Fab

  def snake_case_singular(), do: "user_topic_link"
  def snake_case_plural(), do: "user_topic_links"
  def title_case_singular(), do: "User Topic Link"
  def title_case_plural(), do: "User Topic Links"

  postgres do
    table "user_topic_links"
    repo Navatrack.Repo
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User, primary_key?: true, allow_nil?: false
    belongs_to :topic, Navatrack.Works.Topic, primary_key?: true, allow_nil?: false
  end

  # TODO tighten
  policies do
    policy always() do
      authorize_if always()
    end
  end

end
