defmodule Navatrack.Works.LuminaFoundationSkillLevel do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer

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
