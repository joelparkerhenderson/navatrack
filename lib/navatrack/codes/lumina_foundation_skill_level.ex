defmodule Navatrack.Codes.LuminaFoundationSkillLevel do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer

  def singular_snake_case(), do: "lumina_foundation_skill_level"
  def plural_snake_case(), do: "lumina_foundation_skill_levels"
  def singular_title_case(), do: "Lumina Foundation Skill Level"
  def plural_title_case(), do: "Lumina Foundation Skill Levels"

  postgres do
    table "lumina_foundation_skill_levels"
    repo Navatrack.Repo
  end

  attributes do
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :sign, :string
    attribute :tags, {:array, :string}
    attribute :number, :integer
    attribute :title, :string
    attribute :description, :string
  end

  actions do
 	  defaults [:create, :read, :update, :destroy]
    default_accept [
      :created_at,
      :updated_at,
      :deleted_at,
      :sign,
      :tags,
      :number,
      :title,
      :description,
    ]
  end

end
