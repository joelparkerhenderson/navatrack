defmodule Navatrack.Codes do
  use Ash.Domain,
    otp_app: :navatrack

  resources do
    resource Navatrack.Codes.ILOISCO2008
    resource Navatrack.Codes.LuminaFoundationSkillLevel
  end
end
