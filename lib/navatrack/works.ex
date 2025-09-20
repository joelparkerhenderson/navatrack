defmodule Navatrack.Works do
  use Ash.Domain,
    otp_app: :navatrack

  resources do
    resource Navatrack.Works.Initiative
    resource Navatrack.Works.Skill
    resource Navatrack.Works.LuminaFoundationSkillLevel
  end
end
