defmodule Navatrack.Works.UserReview.Actions do
  use Spark.Dsl.Fragment, of: Ash.Resource

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
      :to_user_id,
      ### content
      :strength,
      :start,
      :stop,
      :continue,
      :change,
      :advice
    ]
  end

end
