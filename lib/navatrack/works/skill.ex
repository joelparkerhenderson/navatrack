defmodule Navatrack.Works.Skill do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer

  def singular_snake_case(), do: "skill"
  def plural_snake_case(), do: "skills"
  def singular_title_case(), do: "Skill"
  def plural_title_case(), do: "Skills"

  postgres do
    table "skills"
    repo Navatrack.Repo
  end

  attributes do
    uuid_primary_key :id
    attribute :sign, :string
    create_timestamp :created_at
    update_timestamp :updated_at
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
  end

  actions do
    defaults [:read, :destroy, create: [], update: []]
    default_accept [
      :sign,
      :created_at,
      :updated_at,
      :title,
      :status,
      :tags,
      :summary_as_markdown,
      :description_as_markdown,
      :avatar_400x400_url,
      :avatar_400x400_alt,
      :image_1080x1080_url,
      :image_1080x1080_alt,
      :image_1920x1080_url,
      :image_1920x1080_alt,
      :image_1080x1920_url,
      :image_1080x1920_alt
    ]
  end

end
