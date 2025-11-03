defmodule Navatrack.Accounts.AccessAssignment.Actions do
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
      ### relationships

      :user_id,
      :access_attribute_id
    ]
  end

end
