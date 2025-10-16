defmodule Navatrack.Accounts.UserLuminaFoundationSkillLevelLink do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication]

  def snake_case_singular(), do: "user_lumina_foundation_skill_level_link"
  def snake_case_plural(), do: "user_lumina_foundation_skill_level_links"
  def title_case_singular(), do: "User Lumina Foundation Skill Level Link"
  def title_case_plural(), do: "User Lumina Foundation Skill Level Links"

  postgres do
    table "user_lumina_foundation_skill_level_links"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read, :destroy, create: :*, update: :*]
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User, primary_key?: true, allow_nil?: false

    belongs_to :lumina_foundation_skill_level, Navatrack.Codes.LuminaFoundationSkillLevel,
      primary_key?: true,
      allow_nil?: false
  end
end
