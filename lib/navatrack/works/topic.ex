defmodule Navatrack.Works.Topic do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Works.Topic.Actions,
      Navatrack.Works.Topic.Attributes,
    ]
  use Navatrack.Works.Topic.Fab

  def snake_case_singular(), do: "topic"
  def snake_case_plural(), do: "topics"
  def title_case_singular(), do: "Topic"
  def title_case_plural(), do: "Topics"

  postgres do
    table "topics"
    repo Navatrack.Repo
  end

  relationships do

    belongs_to :parent, __MODULE__, allow_nil?: true

    many_to_many :users, Navatrack.Accounts.User do
      through Navatrack.Accounts.UserTopicLink
      source_attribute_on_join_resource :topic_id
      destination_attribute_on_join_resource :user_id
    end

  end

end
