
defmodule Navatrack.Codes do
  use Ash.Domain,
    otp_app: :navatrack,
    extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
    resource Navatrack.Codes.Currency
    resource Navatrack.Codes.IloIsco2008
    resource Navatrack.Codes.LuminaFoundationSkillLevel
    resource Navatrack.Codes.MeasurementSystem
    resource Navatrack.Codes.MeasurementUnit
    resource Navatrack.Codes.UkGdadPcfRole
    resource Navatrack.Codes.UkGdadPcfRoleFamily
    resource Navatrack.Codes.UkGdadPcfRoleLevel
    resource Navatrack.Codes.UkGdadPcfSkill
  end
end
