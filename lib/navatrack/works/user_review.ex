defmodule Navatrack.Works.UserReview do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Works.UserReview.Actions,
      Navatrack.Works.UserReview.Attributes,
    ]
  use Navatrack.Works.UserReview.Fab

  def snake_case_singular(), do: "user_review"
  def snake_case_plural(), do: "user_reviews"
  def title_case_singular(), do: "UserReview"
  def title_case_plural(), do: "UserReviews"

  postgres do
    table "user_reviews"
    repo Navatrack.Repo
  end

  relationships do

    belongs_to :parent, __MODULE__, allow_nil?: true

    belongs_to :by, Navatrack.Accounts.User do
      source_attribute :by_user_id
    end

    belongs_to :to, Navatrack.Accounts.User do
      source_attribute :to_user_id
    end

  end

end
