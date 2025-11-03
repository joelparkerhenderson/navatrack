defmodule Navatrack.Codes.UkGdadPcfRoleFamily do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Codes.UkGdadPcfRoleFamily.Actions,
      Navatrack.Codes.UkGdadPcfRoleFamily.Attributes
    ]

  def snake_case_singular(), do: "uk_gdad_pcf_role_family"
  def snake_case_plural(), do: "uk_gdad_pcf_role_families"
  def title_case_singular(), do: "UK GDAD PCF Role Family"
  def title_case_plural(), do: "UK GDAD PCF Role Families"

  postgres do
    table "uk_gdad_pcf_role_families"
    repo Navatrack.Repo
  end

end
