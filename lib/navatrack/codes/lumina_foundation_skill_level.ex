defmodule Navatrack.Codes.LuminaFoundationSkillLevel do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer
  use One

  def snake_case_singular(), do: "lumina_foundation_skill_level"
  def snake_case_plural(), do: "lumina_foundation_skill_levels"
  def title_case_singular(), do: "Lumina Foundation Skill Level"
  def title_case_plural(), do: "Lumina Foundation Skill Levels"

  postgres do
    table "lumina_foundation_skill_levels"
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

    attribute :number, :integer do
      allow_nil? false
      public? true
    end

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :description, :string do
      allow_nil? false
      public? true
    end

  end

end
