defmodule Navatrack.Codes.UkGdadPcfRole do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer
  use One

  def snake_case_singular(), do: "uk_gdad_pcf_role"
  def snake_case_plural(), do: "uk_gdad_pcf_roles"
  def title_case_singular(), do: "UK GDAD PCF Role"
  def title_case_plural(), do: "UK GDAD PCF Roles"

  postgres do
    table "uk_gdad_pcf_roles"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read]
  end

  attributes do
    uuid_primary_key :id

    attribute :locale_code, :string do
      allow_nil? false
      public? true
    end

    attribute :family, :string do
      allow_nil? false
      public? true
    end

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :url, :string do
      allow_nil? false
      public? true
    end

    attribute :description_as_markdown, :string do
      allow_nil? false
      public? true
    end

    attribute :level_name, :string do
      allow_nil? false
      public? true
    end

    attribute :level_description_as_markdown, :string do
      allow_nil? false
      public? true
    end

    attribute :senior_civil_service_flag, :boolean do
      allow_nil? false
      public? true
    end

  end

end
