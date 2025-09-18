defmodule Navatrack.Works.Skill do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "skills"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read, :destroy, create: [], update: []]
  end

  attributes do
    uuid_primary_key :id
    attribute :title, :string
    attribute :status, :string
    attribute :tags, {:array, :string}
    attribute :summary_as_markdown, :string
    attribute :description_as_markdown, :string
    attribute :avatar_400x400_url, :string
    attribute :avatar_400x400_alt, :string
    attribute :image_1080x1080_url, :string
    attribute :image_1080x1080_alt, :string
    attribute :image_1920x1080_url, :string
    attribute :image_1920x1080_alt, :string
    attribute :image_1080x1920_url, :string
    attribute :image_1080x1920_alt, :string
    timestamps()
  end
end
