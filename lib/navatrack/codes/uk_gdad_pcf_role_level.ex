defmodule Navatrack.Codes.UkGdadPcfRoleLevel do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Codes.UkGdadPcfRoleLevel.Actions,
      Navatrack.Codes.UkGdadPcfRoleLevel.Attributes,
    ]

  def snake_case_singular(), do: "uk_gdad_pcf_role_level"
  def snake_case_plural(), do: "uk_gdad_pcf_role_levels"
  def title_case_singular(), do: "UK GDAD PCF Role Level"
  def title_case_plural(), do: "UK GDAD PCF Role Levels"

  postgres do
    table "uk_gdad_pcf_role_levels"
    repo Navatrack.Repo
  end

  relationships do
    belongs_to :uk_gdad_pcf_role, Navatrack.Codes.UkGdadPcfRoleLevel
  end
end
