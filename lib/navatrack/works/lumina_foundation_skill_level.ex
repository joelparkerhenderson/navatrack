defmodule Navatrack.Works.LuminaFoundationSkillLevel do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer

  def snake_case_singular do
    "lumina_foundation_skill_level"
  end

  def plural_snake_case do
    "lumina_foundation_skill_levels"
  end

  def singular_title_case do
    "Organization"
  end

  def plural_title_case do
    "Organizations"
  end

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
