defmodule Navatrack.Accounts.UserLuminaFoundationSkillLevelLink do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication],
    fragments: [
      Navatrack.Accounts.UserLuminaFoundationSkillLevelLink.Actions,
      Navatrack.Accounts.UserLuminaFoundationSkillLevelLink.Attributes,
    ]
  use Navatrack.Accounts.UserLuminaFoundationSkillLevelLink.Fab

  def snake_case_singular(), do: "user_lumina_foundation_skill_level_link"
  def snake_case_plural(), do: "user_lumina_foundation_skill_level_links"
  def title_case_singular(), do: "User Lumina Foundation Skill Level Link"
  def title_case_plural(), do: "User Lumina Foundation Skill Level Links"

  postgres do
    table "user_lumina_foundation_skill_level_links"
    repo Navatrack.Repo
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User, primary_key?: true, allow_nil?: false
    belongs_to :lumina_foundation_skill_level, Navatrack.Codes.LuminaFoundationSkillLevel, primary_key?: true, allow_nil?: false
  end

  # TODO tighten
  policies do
    policy always() do
      authorize_if always()
    end
  end

end
