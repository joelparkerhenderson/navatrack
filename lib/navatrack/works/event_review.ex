defmodule Navatrack.Works.EventReview do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Works.EventReview.Actions,
      Navatrack.Works.EventReview.Attributes,
    ]
  use Navatrack.Works.EventReview.Fab

  def snake_case_singular(), do: "event_review"
  def snake_case_plural(), do: "event_reviews"
  def title_case_singular(), do: "EventReview"
  def title_case_plural(), do: "EventReviews"

  postgres do
    table "event_reviews"
    repo Navatrack.Repo
  end

  relationships do

    belongs_to :parent, __MODULE__, allow_nil?: true

    belongs_to :by, Navatrack.Accounts.User do
      source_attribute :by_user_id
    end

    belongs_to :to, Navatrack.Works.Event do
      source_attribute :to_event_id
    end

  end

end
