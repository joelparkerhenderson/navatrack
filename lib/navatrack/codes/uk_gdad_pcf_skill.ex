defmodule Navatrack.Codes.UkGdadPcfSkill do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Codes.UkGdadPcfSkill.Actions,
      Navatrack.Codes.UkGdadPcfSkill.Attributes,
    ]
  use One

  def snake_case_singular(), do: "uk_gdad_pcf_skill"
  def snake_case_plural(), do: "uk_gdad_pcf_skills"
  def title_case_singular(), do: "UK GDAD PCF Skill"
  def title_case_plural(), do: "UK GDAD PCF Skills"

  postgres do
    table "uk_gdad_pcf_skills"
    repo Navatrack.Repo
  end

end
