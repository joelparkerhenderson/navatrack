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
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :sign, :string
    attribute :title, :string
    attribute :status, :string
    attribute :tags, {:array, :string}
    attribute :summary_as_markdown, :string
    attribute :description_as_markdown, :string
    attribute :avatar_image_400x400_url, :string
    attribute :avatar_image_400x400_alt, :string
    attribute :main_image_1080x1080_url, :string
    attribute :main_image_1080x1080_alt, :string
    attribute :main_image_1920x1080_url, :string
    attribute :main_image_1920x1080_alt, :string
    attribute :main_image_1080x1920_url, :string
    attribute :main_image_1080x1920_alt, :string
  end

  actions do
 	  defaults [:create, :read, :update, :destroy]
    default_accept [
      :created_at,
      :updated_at,
      :deleted_at,
      :sign,
      :title,
      :status,
      :tags,
      :summary_as_markdown,
      :description_as_markdown,
      :avatar_image_400x400_url,
      :avatar_image_400x400_alt,
      :main_image_1080x1080_url,
      :main_image_1080x1080_alt,
      :main_image_1920x1080_url,
      :main_image_1920x1080_alt,
      :main_image_1080x1920_url,
      :main_image_1080x1920_alt
    ]
  end

end
