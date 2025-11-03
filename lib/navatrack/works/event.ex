defmodule Navatrack.Works.Event do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Works.Event.Actions,
      Navatrack.Works.Event.Attributes,
    ]
  use Navatrack.Works.Event.Fab

  def snake_case_singular(), do: "event"
  def snake_case_plural(), do: "events"
  def title_case_singular(), do: "Event"
  def title_case_plural(), do: "Events"

  postgres do
    table "events"
    repo Navatrack.Repo
  end

  relationships do

    belongs_to :parent, __MODULE__, allow_nil?: true

    many_to_many :users, Navatrack.Accounts.User do
      through Navatrack.Accounts.UserEventLink
      source_attribute_on_join_resource :event_id
      destination_attribute_on_join_resource :user_id
    end

  end

end
