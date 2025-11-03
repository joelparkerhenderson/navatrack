defmodule Navatrack.Works.Message.Actions do
  use Spark.Dsl.Fragment, of: Ash.Resource

  actions do
    defaults [:create, :read, :update, :destroy]

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

      :from_user_id,
      :to_user_id
    ]
  end

end
