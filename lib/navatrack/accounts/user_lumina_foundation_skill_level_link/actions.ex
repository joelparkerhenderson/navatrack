defmodule Navatrack.Accounts.UserLuminaFoundationSkillLevelLink.Actions do
  use Spark.Dsl.Fragment, of: Ash.Resource

  actions do
    defaults [:read, :destroy, :create, :update]
    default_accept [
      :created_at,
      :updated_at,
      :retired_at,
      :locale_code,
      :user_id,
      :lumina_foundation_skill_level_id,
    ]
  end

end
