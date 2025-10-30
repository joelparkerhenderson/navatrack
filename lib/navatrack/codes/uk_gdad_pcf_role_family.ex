defmodule Navatrack.Codes.UkGdadPcfRoleFamily do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer

  def snake_case_singular(), do: "uk_gdad_pcf_role_family"
  def snake_case_plural(), do: "uk_gdad_pcf_role_families"
  def title_case_singular(), do: "UK GDAD PCF Role Family"
  def title_case_plural(), do: "UK GDAD PCF Role Families"

  postgres do
    table "uk_gdad_pcf_role_families"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read, create: :*]
  end

  attributes do
    uuid_primary_key :id

    attribute :locale_code, :string do
      allow_nil? false
      public? true
    end

    attribute :name, :string do
      allow_nil? false
      public? true
    end
  end
end
