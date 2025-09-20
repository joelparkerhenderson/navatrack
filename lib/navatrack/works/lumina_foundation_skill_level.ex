defmodule Navatrack.Works.LuminaFoundationSkillLevel do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer

  def singular_snake_case(), do: "lumina_foundation_skill_level"
  def plural_snake_case(), do: "lumina_foundation_skill_levels"
  def singular_title_case(), do: "Lumina Foundation Skill Level"
  def plural_title_case(), do: "Lumina Foundation Skill Levels"

  postgres do
    table "lumina_foundation_skill_levels"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read, :destroy, create: [], update: []]
  end

  attributes do
    uuid_primary_key :id
    attribute :number, :integer
    attribute :title, :string
    attribute :description, :string
  end
end
