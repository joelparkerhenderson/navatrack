defmodule Navatrack.Accounts.UserEventLink.Actions do
  use Spark.Dsl.Fragment, of: Ash.Resource

  actions do
    defaults [:read, :destroy, :create, :update]

    default_accept [
      :created_at,
      :updated_at,
      :retired_at,
      :locale_code,
      :user_id,
      :event_id,
    ]
  end

end
