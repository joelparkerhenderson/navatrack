defmodule Navatrack.Accounts do
  use Ash.Domain,
    otp_app: :navatrack

  resources do
    resource Navatrack.Accounts.Token
    resource Navatrack.Accounts.User
    # Links from different domains
    resource Navatrack.Codes.IloIsco2008
    resource Navatrack.Codes.LuminaFoundationSkillLevel
    resource Navatrack.Works.Topic
    resource Navatrack.Codes.UkGdadPcfRole
    resource Navatrack.Codes.UkGdadPcfSkill
    resource Navatrack.Works.Trait
    resource Navatrack.Works.Topic
    resource Navatrack.Works.Topic
    # Links into Codes domain
    resource Navatrack.Accounts.UserIloIsco2008Link
    resource Navatrack.Accounts.UserLuminaFoundationSkillLevelLink
    resource Navatrack.Accounts.UserUkGdadPcfRoleLink
    resource Navatrack.Accounts.UserUkGdadPcfSkillLink
    # Links into Works domain
    resource Navatrack.Accounts.UserEventLink
    resource Navatrack.Accounts.UserGroupLink
    resource Navatrack.Accounts.UserPlanLink
    resource Navatrack.Accounts.UserTaskLink
    resource Navatrack.Accounts.UserTopicLink
    resource Navatrack.Accounts.UserTraitLink
  end
end
