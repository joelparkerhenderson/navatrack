defmodule Navatrack.Codes.UkGdadPcfRoleLevel do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer

  def snake_case_singular(), do: "uk_gdad_pcf_role_level"
  def snake_case_plural(), do: "uk_gdad_pcf_role_levels"
  def title_case_singular(), do: "UK GDAD PCF Role Level"
  def title_case_plural(), do: "UK GDAD PCF Role Levels"

  postgres do
    table "uk_gdad_pcf_role_levels"
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

    attribute :uk_gdad_pcf_role_id, :uuid do
      allow_nil? false
      public? true
    end

    attribute :uk_gdad_pcf_role_order, :integer do
      allow_nil? false
      public? true
    end

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :description_as_markdown, :string do
      allow_nil? false
      public? true
    end
  end

  relationships do
    belongs_to :uk_gdad_pcf_role, Navatrack.Codes.UkGdadPcfRoleLevel
  end
end
