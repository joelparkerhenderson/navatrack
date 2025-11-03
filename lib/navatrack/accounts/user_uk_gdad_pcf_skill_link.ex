defmodule Navatrack.Accounts.UserUkGdadPcfSkillLink do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication],
    fragments: [
      Navatrack.Accounts.UserUkGdadPcfSkillLink.Actions,
      Navatrack.Accounts.UserUkGdadPcfSkillLink.Attributes,
    ]
  use Navatrack.Accounts.UserUkGdadPcfSkillLink.Fab

  def snake_case_singular(), do: "user_uk_gdad_pcf_skill_link"
  def snake_case_plural(), do: "user_uk_gdad_pcf_skill_links"
  def title_case_singular(), do: "User UK GDAD PCF Skill Link"
  def title_case_plural(), do: "User UK GDAD PCF Skill Links"

  postgres do
    table "user_uk_gdad_pcf_skill_links"
    repo Navatrack.Repo
  end

  relationships do
    belongs_to :user, Navatrack.Accounts.User, primary_key?: true, allow_nil?: false
    belongs_to :uk_gdad_pcf_skill, Navatrack.Codes.UkGdadPcfSkill, primary_key?: true, allow_nil?: false
  end

  # TODO tighten
  policies do
    policy always() do
      authorize_if always()
    end
  end

end
