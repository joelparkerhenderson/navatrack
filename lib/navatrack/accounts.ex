defmodule Navatrack.Accounts do
  use Ash.Domain,
    otp_app: :navatrack,
    extensions: [AshAdmin.Domain]

  # AshAdmin
  admin do
    show? true
  end

  resources do
    resource Navatrack.Accounts.Token
    resource Navatrack.Accounts.User
    # Access
    resource Navatrack.Accounts.AccessAssignment
    resource Navatrack.Accounts.AccessAttribute
    resource Navatrack.Accounts.AccessPermission
    resource Navatrack.Accounts.AccessOperation
    # Links into Codes domain
    resource Navatrack.Accounts.UserIloIsco2008Link
    resource Navatrack.Accounts.UserLuminaFoundationSkillLevelLink
    resource Navatrack.Accounts.UserUkGdadPcfRoleLink
    resource Navatrack.Accounts.UserUkGdadPcfSkillLink
    # Links into Works domain
    resource Navatrack.Accounts.UserEventLink
    resource Navatrack.Accounts.UserGroupLink
    resource Navatrack.Accounts.UserAimLink
    resource Navatrack.Accounts.UserTaskLink
    resource Navatrack.Accounts.UserTopicLink
    resource Navatrack.Accounts.UserTraitLink
    resource Navatrack.Accounts.AccessPermission
    resource Navatrack.Accounts.AccessAssignment
  end
end
