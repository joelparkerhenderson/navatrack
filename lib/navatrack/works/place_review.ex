defmodule Navatrack.Works.PlaceReview do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Works.PlaceReview.Actions,
      Navatrack.Works.PlaceReview.Attributes,
    ]
  use Navatrack.Works.PlaceReview.Fab

  def snake_case_singular(), do: "place_review"
  def snake_case_plural(), do: "place_reviews"
  def title_case_singular(), do: "PlaceReview"
  def title_case_plural(), do: "PlaceReviews"

  postgres do
    table "place_reviews"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read, :destroy, :create, :update]

    default_accept [
      ### meta
      :created_at,
      :updated_at,
      :retired_at,
      :locale_code,
      :parent_id,
      :parent_order,
      ### card
      :name,
      :sign,
      :status,
      :tagging,
      :note,
      ### relationships

      :by_user_id,
      :to_place_id,
      ### content
      :strength,
      :start,
      :stop,
      :continue,
      :change,
      :advice
    ]
  end

  relationships do

    belongs_to :parent, __MODULE__, allow_nil?: true

    belongs_to :by, Navatrack.Accounts.User do
      source_attribute :by_user_id
    end

    belongs_to :to, Navatrack.Works.Place do
      source_attribute :to_place_id
    end

  end

end
