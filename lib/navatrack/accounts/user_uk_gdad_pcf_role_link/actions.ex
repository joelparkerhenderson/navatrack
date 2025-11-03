defmodule Navatrack.Accounts.UserUkGdadPcfRoleLink.Actions do
  use Spark.Dsl.Fragment, of: Ash.Resource

  actions do
    defaults [:read, :destroy, :create, :update]
    default_accept [
      :created_at,
      :updated_at,
      :retired_at,
      :locale_code,
      :user_id,
      :uk_gdad_pcf_role_id,
    ]
  end

end
